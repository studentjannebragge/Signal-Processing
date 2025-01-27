% tunnuslukujen laskeminen

%alustus
clear %poistetaan muttujat muistista
close all % suljetaan avoinna olevat piirtoikkunat

%ladataan datatiedosto data_whole.mat. Tallentuu muuttujaan "data_whole"
load data_whole.mat;

%Tutkitaan taulukon sisältöä
disp (data_whole)

%Alustetaan taulukko nollilla tunnusluvuille
Tunnusluvut=zeros(4,8);

Tunnusluvut(1,:)=sum(data_whole) % Laskee summat sarakkeittain ja sijoittaa taulukon 1. riville
Tunnusluvut(2,:)=mean(data_whole) % Laskee keskiarvot sarakkeittainja sijoittaa taulukon 2. riville
Tunnusluvut(3,:)=std(data_whole) % Laskee keskihajonnan sarakkeittain ja sijoittaa taulukon 3. riville
Tunnusluvut(4,:)=var(data_whole) % Laskee varianssin sarakkeittain ja sijoittaa taulukon 4. riville

% näytetää taulukon sisältö
disp(Tunnusluvut)

%Esitetään datasetit (X1, Y1), (X2, Y2), (X3, Y3), (X4, Y4)
%Alla visualisointi on suoritettu kkonaiselle dataetille

figure;
subplot(2,2,1)
plot(data_whole(:,1), data_whole(:,5),'*') %kaikki rivit ja ensimmäinen sarake
title('Data1')
grid on

subplot(2,2,2)
plot(data_whole(:,2), data_whole(:,6),'*r')
title('Data2')
grid on

subplot(2,2,3)
plot(data_whole(:,3), data_whole(:,7),'*g')
title('Data3')
grid on

subplot(2,2,4)
plot(data_whole(:,4), data_whole(:,8), '*k')
title('Data4')
grid on

waitforbuttonpress
