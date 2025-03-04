% DiSiPer - lisätehtävä 3 - Janne Bragge

close all

% 1. Luetaan tiedostot
data_fault = load('fc_fault.mat');
if isempty(data_fault)
    error('Virhe: fc_fault.mat -tiedoston lataaminen epäonnistui.');
end

data_norm = load('fc_norm.mat');
if isempty(data_norm)
    error('Virhe: fc_norm.mat -tiedoston lataaminen epäonnistui.');
end

% Muodostetaan muuttujat
fault_signal = data_fault.fc_fault;
norm_signal = data_norm.fc_norm;

% Näytteistystaajuus
fs = 0.1; % Hz
dt = 1 / fs; % Näyteväliaika

% 2. Luodaan aikavektori ja piirretään alkuperäiset signaalit
t_fault = 0 : dt : (length(fault_signal) - 1) * dt;
t_norm = 0 : dt : (length(norm_signal) - 1) * dt;

figure;
subplot(2, 1, 1);
plot(t_fault, fault_signal);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Häiriöllinen signaali');
grid on;
annotation('textbox', [0.1, 0.45, 0.3, 0.05], 'String', 'Alkuperäinen häiriöllinen signaali');

subplot(2, 1, 2);
plot(t_norm, norm_signal);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Normaali signaali');
grid on;
annotation('textbox', [0.1, 0.05, 0.3, 0.05], 'String', 'Alkuperäinen normaali signaali');

waitforbuttonpress;

% 3. Luodaan uudet muuttujat rajoitetulle aikavälille
start_index = 2800;
end_index = 4800;

fault_signal_zoom = fault_signal(start_index:end_index);
norm_signal_zoom = norm_signal(start_index:end_index);

% 4.  Lasketaan zoomatut aikavektorit alkuperäisten perusteella
t_zoom_fault = t_fault(start_index:end_index);
t_zoom_norm = t_norm(start_index:end_index);

% 5. Piirretään rajoitetun aikavälin signaalit
figure;

subplot(2, 1, 1);
plot(t_zoom_fault, fault_signal_zoom);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Häiriöllinen signaali (2800s - 4800s)');
grid on;

subplot(2, 1, 2);
plot(t_zoom_norm, norm_signal_zoom);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Normaali signaali (2800s - 4800s)');
grid on;

waitforbuttonpress;

% 6. Muodostetaan ja piirretään amplitudispektrit
N_fault = length(fault_signal_zoom);
N_norm = length(norm_signal_zoom);

% --- Tarkistetaan signaalien pituudet (parillinen/pariton) ---
if mod(N_fault, 2) == 0
    disp('fault_signal_zoom on parillisen pituinen.');
else
    disp('fault_signal_zoom on parittoman pituinen.');
end

if mod(N_norm, 2) == 0
    disp('norm_signal_zoom on parillisen pituinen.');
else
    disp('norm_signal_zoom on parittoman pituinen.');
end
% -------------------------------------------------------------


f_fault = fs * (0 : (N_fault / 2)) / N_fault;
f_norm = fs * (0 : (N_norm / 2)) / N_norm;

fault_fft = fft(fault_signal_zoom);
norm_fft = fft(norm_signal_zoom);

P1_fault = abs(fault_fft / N_fault);
P1_norm = abs(norm_fft / N_norm);

P2_fault = P1_fault(1 : (N_fault / 2) + 1);
P2_norm = P1_norm(1 : (N_norm / 2) + 1);

% ---  amplitudiskaalaus (ottaa huomioon parillisuuden/parittomuuden) ---
if mod(N_fault, 2) == 0  % Parillinen
    P2_fault(2 : end - 1) = 2 * P2_fault(2 : end - 1);
else % Pariton
    P2_fault(2 : end) = 2 * P2_fault(2 : end);
end

if mod(N_norm, 2) == 0  % Parillinen
    P2_norm(2 : end - 1) = 2 * P2_norm(2 : end - 1);
else % Pariton
    P2_norm(2 : end) = 2 * P2_norm(2 : end);
end
% ------------------------------------------------------------------------------

figure;
subplot(2, 1, 1);
plot(f_fault, P2_fault);
xlabel('Taajuus [Hz]');
ylabel('Amplitudi');
title('Häiriöllisen signaalin spektri');
grid on;

subplot(2, 1, 2);
plot(f_norm, P2_norm);
xlabel('Taajuus [Hz]');
ylabel('Amplitudi');
title('Normaalin signaalin spektri');
grid on;

% 7.  Tulostetaan spektrien tulkinta disp-funktiolla, joka näkyy komentorivillä koodin ajamisen jälkeen
disp('Spektrien tulkinta:');
disp('-------------------');
disp('Häiriöllisen signaalin spektrissä on korkea DC-komponentti,');
disp('useita piikkejä eri taajuuksilla ja epäsäännöllinen muoto,');
disp('mikä viittaa merkittävään häiriöön.');
disp('Normaalin signaalin spektri on tasaisempi, matalampi DC-');
disp('komponentti ja vähemmän piikkejä, mikä osoittaa vähemmän');
disp('häiriötä ja vakaamman signaalin.');
disp('yritin tehdä ikkunointia mutta en saanut sitä onnistumaan.')

disp('----------------------------------------------------------');
disp('Tukiäly: LLM Gemini Advance 2.0 Pro Experimental');
