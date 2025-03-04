% DiSiPer - lisätehtävä 3

% 1. Lue tiedostot
data_fault = load('fc_fault.mat');
if isempty(data_fault)
    error('Virhe: fc_fault.mat -tiedoston lataaminen epäonnistui.');
end

data_norm = load('fc_norm.mat');
if isempty(data_norm)
    error('Virhe: fc_norm.mat -tiedoston lataaminen epäonnistui.');
end

% Käytä oikeita muuttujien nimiä
fault_signal = data_fault.fc_fault;
norm_signal = data_norm.fc_norm;

% Näytteistystaajuus
fs = 0.1; % Hz
dt = 1/fs; % Näyteväliaika

% 2. Luo aikavektori ja piirrä alkuperäiset signaalit
t = 0:dt:(length(fault_signal)-1)*dt;
t2 = 0:dt:(length(norm_signal)-1)*dt;

figure;
subplot(2,1,1);
plot(t, fault_signal);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Häiriöllinen signaali');

subplot(2,1,2);
plot(t2, norm_signal);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Normaali signaali');

waitforbuttonpress;

% 3. Luo uudet muuttujat rajoitetulle aikavälille
start_index = 2800;
end_index = 4800;

fault_signal_zoom = fault_signal(start_index:end_index);
norm_signal_zoom = norm_signal(start_index:end_index);

t_zoom_fault = 0:dt:(length(fault_signal_zoom)-1)*dt;
t_zoom_norm = 0:dt:(length(norm_signal_zoom)-1)*dt;

% 4. Piirrä rajoitetun aikavälin signaalit omiin ikkunoihin subplot-komennolla
figure;
subplot(2,1,1);
plot(t_zoom_fault, fault_signal_zoom);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Häiriöllinen signaali (rajoitettu)');

figure;
subplot(2,1,2);
plot(t_zoom_norm, norm_signal_zoom);
xlabel('Aika [s]');
ylabel('Lämpötila [C]');
title('Normaali signaali (rajoitettu)');

waitforbuttonpress;

% 5. Muodosta ja piirrä amplitudispektrit
N = length(fault_signal_zoom);
f = fs*(0:(N/2))/N;

fault_fft = fft(fault_signal_zoom);
norm_fft = fft(norm_signal_zoom);

P1_fault = abs(fault_fft/N);
P1_norm = abs(norm_fft/N);

P2_fault = P1_fault(1:N/2+1);
P2_norm = P1_norm(1:N/2+1);

P2_fault(2:end-1) = 2*P2_fault(2:end-1);
P2_norm(2:end-1) = 2*P2_norm(2:end-1);

figure;
subplot(2,1,1);
plot(f, P2_fault);
xlabel('Taajuus [Hz]');
ylabel('Amplitudi');
title('Häiriöllisen signaalin spektri');

subplot(2,1,2);
plot(f, P2_norm);
xlabel('Taajuus [Hz]');
ylabel('Amplitudi');
title('Normaalin signaalin spektri');

% 6. Spektrien tulkinta (disp-funktio)
disp('Spektrien tulkinta:');
disp('Häiriöllisen signaalin spektrissä on havaittavissa selvempiä piikkejä tietyillä taajuuksilla,');
disp('mikä viittaa siihen, että signaalissa on voimakkaampia jaksollisia komponentteja.');
disp('Normaalin signaalin spektri on tasaisempi, mikä viittaa siihen, että signaali on vakaampi');
disp('ja siinä on vähemmän jaksollisia häiriöitä.');
disp('Spektreissä on selvä ero piikkien esiintymisessä.');
