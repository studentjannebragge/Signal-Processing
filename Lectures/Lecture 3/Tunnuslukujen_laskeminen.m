%Tunnuslukujen laskeminen


%Aloitetaan puhtaalta pöydältä ja tehdään alustukset

clear %poistetaan muuttujat muistista
close all %suljetaan avoinna olevat piirtoikkunat

%Ladataan tiedosto data_whole.mat. Tallentuu muuttujaan "data_whole"
load data_whole.mat;

%Tutkitaan taulukon sisältöä
disp (data_whole)

%Lasketaan tunnusluvut (summa, keskiarvo, std, ja var) sek� sijoitetaan ne taulukkoon
%Taulukon ylimmälle riville summa, seuraavalle, KA, sitten STD ja viimeiseksi VAR
%Koska tunnusluvut lasketaan sarakkeittain (8 kpl), tarvitaan tunnusluvuille 4x8 kokoinen taulukko


%Alustetaan taulukko nollilla tunnusluvuille
Tunnusluvut=zeros(4,8);

Tunnusluvut(1,:)=sum(data_whole); %Laskee summat sarakkeittain ja sijoittaa taulukon 1.riville
Tunnusluvut(2,:)=mean(data_whole); %Laskee KA:t sarakkeittain ja sijoittaa taulukon 2.riville
Tunnusluvut(3,:)=std(data_whole); %Laskee STD:t sarakkeittain ja sijoittaa taulukon 3.riville
Tunnusluvut(4,:)=var(data_whole); %Laskee VAR sarakkeittain ja sijoittaa taulukon 4.riville

%Tutustutaan taulukon sisältöön
disp(Tunnusluvut)


%Esitetään datasetit (X1, Y1),(X2, Y2), (X3, Y3), (X4,Y4)
%Alla visualisointi on suoritettu kokonaiselle datasetille
figure;
subplot(2,2,1)
plot(data_whole(:,1),data_whole(:,5),'*')
title('Data 1')
grid on

subplot(2,2,2)
plot(data_whole(:,2),data_whole(:,6),'*r')
title('Data 2')
grid on

subplot(2,2,3)
plot(data_whole(:,3),data_whole(:,7),'*g')
title('Data 3')
grid on

subplot(2,2,4)
plot(data_whole(:,4),data_whole(:,8),'*k')
title('Data 4')
grid on


waitforbuttonpress

%Suoritetaan käsittely myös pilkotuille dataseteille
%Tehdään siis uudestaan sama operaatio kuin yllä

%Ladataan yksittäiset datasetit
load data_1.mat
load data_2.mat
load data_3.mat
load data_4.mat

%Visualisoidaan datasetit käyttäen erilaisia värejä ja markkereita
%https://octave.sourceforge.io/octave/function/plot.html
figure;
subplot(2,2,1)
plot(data_1(:,1),data_1(:,2),'+')
title('Data 1')
grid on

subplot(2,2,2)
plot(data_2(:,1),data_2(:,2),'sr')
title('Data 2')
grid on

subplot(2,2,3)
plot(data_3(:,1),data_3(:,2),'pg')
title('Data 3')
grid on

subplot(2,2,4)
plot(data_3(:,1),data_3(:,2),'dk')
title('Data 4')
grid on


