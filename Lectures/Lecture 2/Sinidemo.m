%Skriptin demoilua

%{
tekstiä
%}
fs=100;
dt= 1/fs;

t_vekt= 0:dt:1;
sini=4*sin(2*pi*3.5*t_vekt);
plot(t_vekt,sini,'r')
xlabel('Aika [s]')
ylabel('Signaalin arvo')
title('Sinisignaali')
grid on

waitforbuttonpress


figure; plot(t_vekt,sini*2,'g')
xlabel('Aika [s]')
ylabel('Signaalin arvo')
title('Sinisignaali')
grid on

waitforbuttonpress

close all


