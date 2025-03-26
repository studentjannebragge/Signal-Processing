% 3-ulotteinen havainnollistus kompleksisen eksponenttifunktion
% käyttäytymisestä

% Tyhjennetään muuttujat muistista
clear
% Alustetaan aikavälin pituudeksi 2 sekuntia
maksaika=2;
% Määritetään näytepisteiden väliseksi ajaksi 0.01 sekuntia
dt=0.01;
% Asetetaan taajuudeksi 2 Hz
f=2;
% Asetetaan amplitudiksi 2
A=2;

%Luodaan aikavektori
t=0:dt:maksaika;

%Alustetaan signaaleille z1 ja z2 nollavektorit

z1=zeros(1,length(t));
z2=zeros(1,length(t));

%Muodostetaan signaalit (1i = imaginaariyksikkö)
z1=A*exp(1i*2*pi*f*t);
z2=A*exp(-1i*2*pi*f*t);

%Erotetaan reaali- ja imaginaariosat omiin vektoreihin
z1_real=real(z1);
z2_real=real(z2);
z1_imag=imag(z1);
z2_imag=imag(z2);

for i = 1:length(t)

    axis([0 maksaika -4 4 -4 4]) % Määritellään akseliston skaala: 0...2 x-akseli, -4...4 y-akseli, -4...4 z-akseli
    xlabel('AIKA')
    ylabel('REAALIOSA')
    zlabel('IMAGINAARIOSA')
    grid on
    plot3(t(i),z1_real(i),z1_imag(i),'r*') % Piirretään reaali- ja imaginaariosan määrittelemä piste (kompleksiluku) ajan funktiona

    hold on % lukitaan kuvaaja seuraavaa silmukan suorituskierrosta varten

    pause(0.03) % Määritetään silmukoiden suoritusten välinen viive/odotusaika


end

for i = 1:length(t)


    plot3(t(i),z2_real(i),z2_imag(i),'b*') % Piirretään reaali- ja imaginaariosan määrittelemä piste (kompleksiluku) ajan funktiona

    hold on % lukitaan kuvaaja seuraavaa silmukan suorituskierrosta varten

    pause(0.03) % Määritetään silmukoiden suoritusten välinen viive/odotusaika
end

hold off



% Piirretään erilliseen ikkunaan imaginaaristen (kompleksisten) signaalien summasignaali

summa=z1+z2;
figure('Name', 'Summa')
plot(t,summa,'g') % Piirretään summasignaali eli lasketaan yhteen reaali- ja imaginaariosat. Huomaa ,että x1, x2, y1 ja y2 ovat vektoreita
xlabel('Aika [s]')
ylabel('Amplitudi')
