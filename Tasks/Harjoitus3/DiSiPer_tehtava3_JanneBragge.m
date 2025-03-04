% DiSiPer - lisätehtävä 3 - Janne Bragge (Paranneltu)

close all;
clear; % Lisätään muuttujien tyhjennys

% 1. Luetaan tiedostot ja tarkistetaan lataus
try
    data_fault = load('fc_fault.mat');
    fault_signal = data_fault.fc_fault;
catch ME
    error('Virhe: fc_fault.mat -tiedoston lataaminen epäonnistui: %s', ME.message);
end

try
    data_norm = load('fc_norm.mat');
    norm_signal = data_norm.fc_norm;
catch ME
    error('Virhe: fc_norm.mat -tiedoston lataaminen epäonnistui: %s', ME.message);
end

% Näytteistystaajuus ja -väli
fs = 0.1; % Hz
dt = 1 / fs; % Näyteväliaika

% 2. Luodaan aikavektorit ja piirretään alkuperäiset signaalit
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

% 3. Rajataan signaalit aikavälille 2800s - 4800s
start_index = 2800;
end_index = 4800;

fault_signal_zoom = fault_signal(start_index:end_index);
norm_signal_zoom = norm_signal(start_index:end_index);

t_zoom_fault = t_fault(start_index:end_index);
t_zoom_norm = t_norm(start_index:end_index);

% 4. Piirretään rajatut signaalit
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

% 5. Muodostetaan ja piirretään amplitudispektrit (käytetään ikkunointia)

% Ikkunointi
window = hamming(length(fault_signal_zoom)); % Hamming-ikkuna
windowed_fault = fault_signal_zoom .* window;
windowed_norm = norm_signal_zoom .* hamming(length(norm_signal_zoom));

N_fault = length(windowed_fault);
N_norm = length(windowed_norm);

f_fault = fs * (0 : (N_fault / 2)) / N_fault;
f_norm = fs * (0 : (N_norm / 2)) / N_norm;

fault_fft = fft(windowed_fault);
norm_fft = fft(windowed_norm);

P1_fault = abs(fault_fft / N_fault);
P1_norm = abs(norm_fft / N_norm);

P2_fault = P1_fault(1 : (N_fault / 2) + 1);
P2_norm = P1_norm(1 : (N_norm / 2) + 1);

% Amplitudiskaalaus (parillisuus huomioiden)
if mod(N_fault, 2) == 0
    P2_fault(2 : end - 1) = 2 * P2_fault(2 : end - 1);
else
    P2_fault(2 : end) = 2 * P2_fault(2 : end);
end

if mod(N_norm, 2) == 0
    P2_norm(2 : end - 1) = 2 * P2_norm(2 : end - 1);
else
    P2_norm(2 : end) = 2 * P2_norm(2 : end);
end

figure;
subplot(2, 1, 1);
plot(f_fault, P2_fault);
xlabel('Taajuus [Hz]');
ylabel('Amplitudi');
title('Häiriöllisen signaalin spektri (ikkunointi)');
grid on;

subplot(2, 1, 2);
plot(f_norm, P2_norm);
xlabel('Taajuus [Hz]');
ylabel('Amplitudi');
title('Normaalin signaalin spektri (ikkunointi)');
grid on;

% 6. Spektrien tulkinta
disp('Spektrien tulkinta:');
disp('-------------------');
disp('Häiriöllisen signaalin spektrissä on voimakkaampi DC-komponentti');
disp('ja enemmän korkeampia harmonisia piikkejä kuin normaalissa signaalissa.');
disp('Normaalin signaalin spektri on tasaisempi, mikä viittaa vakaampaan signaaliin.');
disp('Ikkunointi (Hamming) auttoi vähentämään vuotoa ja paransi spektrien erottelukykyä.');
disp('----------------------------------------------------------');
disp('Tukiäly: LLM Gemini Advance 2.0 Pro Experimental');
