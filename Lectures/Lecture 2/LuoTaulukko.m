function [taulukko] = LuoTaulukko(rivit, sarakkeet)
% Funktio saa syötteenään rivien ja sarakkeiden lukumäärät ja palauttaa
% niiden perusteella muodostetun taulukon

% alustetaan indeksimuuttujat
i = 0;
k = 0;

% alustetaan taulukko nollilla
taulukko = zeros(rivit, sarakkeet);

% Muodostetaan taulukko syötteiden mukaisesti
for i = 1:rivit
  for k = 1:sarakkeet
    taulukko(i, k) = k + i;
  end
end

% Näytetään luotu taulukko
disp("Luotu taulukko:");
disp(taulukko);

end

