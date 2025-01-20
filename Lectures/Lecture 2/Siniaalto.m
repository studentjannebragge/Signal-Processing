

function [sini, t_vekt] = Siniaalto (A,f,t_vekt)
%sini = A*sin(a*pi*f*t)

sini=A*sin(2*pi*f*t_vekt);

plot(t_vekt,sini)

endfunction
