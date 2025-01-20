function [sign, t_vekt] = T3_Sinigeneraattori (A,f,pituus)
  %Funktio luo sinisignaalin syötearvojen perusteella
  %A=amplitudi, f=signaalin taajuus, pituus = signaalin pituus sekunteina
  %Funktio palauttaa sinisignaalin arvot ja aikavektorin
  %sign = A*sin(2*pi*f*t)

  close all %sulkee kaikki auki olevat piirtoikkunat

  fs=20*f; %Näytteistystaajuus (näytteitä/s), joka skaalautuu f:n mukaisesti
  dt=1/fs; %Näytteiden väli ajassa mitattuna eli aika-askel

  %{
  %HALUTESSAAN TAULUKOILLE VOI VARATA TILAA ESIM. SEURAAVASTI
  t_vekt=zeros(1,round(fs*pituus)); %alustetaan nollavektori aika-arvoille
  sign=zeros (1,round(fs*pituus)); %alustetaan nollavektori signaalin arvoille
  %HUOM! round-komento pyöristää tulos lähimpään kokonaislukuun

  length(t_vekt)
  length(sign)


  %Käytetään, jos halutaan varmistaa yhtäläinen pituus nollilla alustetun vektorin kanssa
  %t_vekt=(0:1:length(t_vekt)-1)*dt
  %sign= A*sin(2*pi*f*t_vekt);

  %}

  %Aikavektorin luominen ilman alustamista
  t_vekt=0:dt:pituus; %sisältää arvoja välillä 0...pituus, askel on dt

  %Sinisignaalin arvot laskettuna pisteissä, jotka määräytyvät t_vekt mukaan
  sign= A*sin(2*pi*f*t_vekt);


  %length(t_vekt)
  %length(sign)

  % Luodaan uusi piirtoikkuna ja annetaan sille nimi
  figure('Name','Sini')
  plot(t_vekt,sign,'*-') %Esitetään signaali graafisesti
  title('Sinisignaali') %Otsikko, akseleiden nimet ja taustaruudukko
  xlabel('Aika[s]')
  ylabel('Signaalin arvo')
  grid on

  hold on %Pakotetaan piirtoikkuna pysymään auki
  plot(t_vekt,sign*2,'r') %piirretään samaan ikkunaan sama signaali skaalattuna kertoimella 2
  legend('sini 1','sini 2') %lisätään kuvaan selite

  hold off %vapautetaan piirtoikkuna

  waitforbuttonpress %jäädään odottamaan näppäimen painallusta

  %Alustetaan uusi ikkuna ja käytetään signaalin esittämiseen stem-funktiota
  figure('Name','Diskreetti sini')
  stem(t_vekt,sign)
  title('Sinisignaali')
  xlabel('Aika[s]')
  ylabel('Signaalin arvo')
  grid on


  waitforbuttonpress %jäädään odottamaan näppäimen painallusta

  %Subplot-komennon käyttöesimerkki

  %Visualisointi ylempään ikkunaan
  figure('Name','visualisointi subplot-komennolla')
  subplot(2,1,1)
  plot(t_vekt,sign,'r')
  title('Sinisignaali')
  xlabel('Aika[s]')
  ylabel('Signaalin arvo')
  grid on

  %Visualisointi alempaan ikkunaan
  subplot(2,1,2)
  stem(t_vekt,sign,'g')
  title('Sinisignaali')
  xlabel('Aika[s]')
  ylabel('Signaalin arvo')
  grid on

  waitforbuttonpress %jäädään odottamaan näppäimen painallusta

  close all %suljetaan avoimet piirtoikkunat


endfunction

