% Määritellään signaali
x = [-1, 3, 2, 4, 1];

% Signaalin pituus
N = length(x);

% Alustetaan DFT-taulukko
X = zeros(1, N);

% Lasketaan DFT kaavan mukaisesti
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
    end
end

% Näytetään tulokset
disp('DFT-koeffisientit:')
disp(X)

% Piirretään amplitudispektri
figure;
stem(0:N-1, abs(X));
xlabel('Taajuusindeksi k');
ylabel('|X(k)|');
title('DFT:n amplitudispektri');

% Piirretään vaihekulma
figure;
stem(0:N-1, angle(X));
xlabel('Taajuusindeksi k');
ylabel('Phase(X(k))');
title('DFT:n vaihekulma');

