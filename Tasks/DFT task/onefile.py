from PIL import Image
import os
import re

def luonnollinen_jarjestys(tiedosto):
    """ Erottaa numerot tiedostonimestä ja lajittelee ne luonnollisessa järjestyksessä. """
    return [int(text) if text.isdigit() else text.lower() for text in re.split(r'(\d+)', tiedosto)]

def yhdista_jpg_pdf(tulostiedosto):
    # Hae nykyinen hakemisto
    nykyinen_hakemisto = os.getcwd()
    
    # Etsi kaikki JPG-tiedostot nykyisestä hakemistosta
    kuvat = [f for f in os.listdir(nykyinen_hakemisto) if f.lower().endswith('.jpg')]
    
    # Järjestetään tiedostot luonnolliseen järjestykseen
    kuvat.sort(key=luonnollinen_jarjestys)

    if not kuvat:
        print("Ei löytynyt JPG-tiedostoja.")
        return
    
    # Avataan kuvat ja muutetaan ne RGB-muotoon
    kuvat_listana = [Image.open(kuva).convert("RGB") for kuva in kuvat]
    
    # Tallennetaan PDF-muotoon
    kuvat_listana[0].save(tulostiedosto, save_all=True, append_images=kuvat_listana[1:])
    print(f"PDF luotu: {tulostiedosto}")

# Käyttöesimerkki:
tulostiedosto = "yhdistetty.pdf"
yhdista_jpg_pdf(tulostiedosto)

