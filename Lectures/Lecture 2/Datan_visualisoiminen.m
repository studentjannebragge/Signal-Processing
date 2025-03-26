%Esimerkkejä datan visualisoimisesta
% https://docs.octave.org/latest/Two_002dDimensional-Plots.html

close all %Suljetaan avoinna olevat piirtoikkunat
clear %Poistetaan muuttujat muistista

% HISTOGRAMMI
hist (randn (10000, 1), 30); %Normaalijakautuneen satunnaislukujoukon histogrammi
xlabel ("Value");
ylabel ("Count");
title ("Histogram of 10,000 normally distributed random numbers");

waitforbuttonpress

%PYLVÄSDIAGRAMMI (VERTIKAALINEN)

indeksit = [0 1 2 3 4 5];
arvot = [3, 4.5, 7, 1, -2, 10];

figure;
bar(indeksit, arvot)
grid on

waitforbuttonpress


%PYLVÄSDIAGRAMMI (HORISONTAALINEN)

indeksit = [0 1 2 3 4 5];
arvot = [4, 3, 2, 1, 0, -1];

figure;
barh(indeksit, arvot)
grid on

waitforbuttonpress

%PIE CHART (PIIRAKKA- TAI SEKTORIDIAGRAMMI)

lukuarvot=[10, 30, 40, 120, 50, 200];

otsikot={"arvo 1", "arvo 2", "arvo 3", "arvo 4", "arvo 5", "arvo 6"};
pie(lukuarvot, otsikot)

waitforbuttonpress

close all

%Demo piirtoikkunan (figure) asetusten muuttamisesta

t=0:0.01:1; %luodaan aikavektori
sign=2*sin(2*pi*3*t); %muodostetaan testisignaali

figure ('Name','Kuvan asetusten muokkaaminen') %Alustetaan figure ja annetaan sille nimi
plot(t,sign,'--*g') %Esitetään signaali (katkoviiva, markkerina *, värinä vihreä)

xlabel('Aika [s]','FontSize',14,'FontWeight','bold') %Asetetaan x-akselin fontin suuruudeksi 14 ja lihavoidaan teksti
ylabel('Signaalin arvo','FontSize',14,'FontWeight','bold') %Asetetaan x-akselin fontin suuruudeksi 14 ja lihavoidaan teksti
title ('Kuvan asetusten muokkaaminen', 'FontSize',16) %Annetaan kuvalle otsikko, fontin koko 16

legend('Sini','FontSize',14) %Lisätään kuvaan seliteikkuna
set(gca,'FontSize',14) %Asetetaan akselimerkintöjen (tick) fontin suuruudeksi 14
ylim([min(sign)-1 max(sign)+1]) %Määritellään y-akselille tyhjää (+/-1) signaalin ympärille

grid on %Asetetaan taustaruudukko

waitforbuttonpress

close all




