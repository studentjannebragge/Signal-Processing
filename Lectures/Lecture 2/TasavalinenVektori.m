% Luodaan tasavälinen vektori, jossa on arvoja 0...100 (101 kpl)

v1=0:1:100;

#vaihtoehtoinen tapa
v2=linspace(0,100,101);

%Tutkitaan vektoreiden pituudet
length=(v2)
length=(v1)

%Esitetään arvot kuvaajana
plot(v1, '*')
hold on
plot(v2, '+r')
hold off

%Odotetaan, että käyttäjä painaa jotain painiketta
waitforbuttonpress

%jaetaan kaikki v2:n arvot 100:lla
v2_skaalattu=v2./100;

%Alustetaan uusi kuvaaja figure-komennolla ja tutkitaan lopputulosta
figure; plot(v2_skaalattu, '*k')

waitforbuttonpress

close all

