function [kohinakosini, aika] = kohinainen_kosini(A, f, theta, pituus)
    % Alustetaan näytteistystaajuus
    fs = 50 * f; % Näytteiden määrä sekunnissa

    % Lasketaan aika-askel
    dt = 1 / fs;

    % Lasketaan näytepisteiden lukumäärä
    N = fs * pituus;

    % Muodostetaan aikavektori
    aika = 0:dt:(pituus-dt);

    % Muutetaan vaihe asteista radiaaneiksi
    theta_rad = deg2rad(theta);

    % Muodostetaan kosinisignaali
    kosini = A * cos(2 * pi * f * aika + theta_rad);

    % Luodaan kohinasignaali
    kohina = randn(size(aika)); % Satunnainen kohina
    max_kohina = 0.1 * A; % Skaalataan kohinan maksimiarvo
    kohina = max_kohina * kohina / max(abs(kohina)); % Skaalattu kohinasignaali

    % Muodostetaan kohinainen kosinisignaali
    kohinakosini = kosini + kohina;

    % Piirretään kuvaajat
    figure;
    subplot(3, 1, 1);
    plot(aika, kosini);
    title('Puhdas kosinisignaali');
    xlabel('Aika (s)');
    ylabel('Amplitude');

    subplot(3, 1, 2);
    plot(aika, kohina);
    title('Kohinasignaali');
    xlabel('Aika (s)');
    ylabel('Amplitude');

    subplot(3, 1, 3);
    plot(aika, kohinakosini);
    title('Kohinainen kosinisignaali');
    xlabel('Aika (s)');
    ylabel('Amplitude');
end

