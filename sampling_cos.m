clc; clear; close all;
f = 5
duration = 1
t_cont = linspace(0, duration, 1000);  
x_cont = cos(2*pi*f*t_cont);          
subplot(4,1,1);
plot(t_cont, x_cont);
title('Input Signal (Continuous Cosine Wave, 1s)');
xlabel('t'); ylabel('x(t)') ;
fs = 2;
Ts = 1/fs;
t_samp = 0:Ts:duration;
n = 0:length(t_samp)-1;
x_samp1 = cos(2*pi*f*t_samp);
subplot(4,1,2);
stem(n, x_samp1, 'r', 'filled');
title('Under-Sampling (fs = 2 Hz)');
xlabel('Sn'); ylabel('x[n]'); grid on; axis([0 5 -1 1]);
fs = 10;
Ts = 1/fs;
t_samp = 0:Ts:duration;
n = 0:length(t_samp)-1;
x_samp2 = cos(2*pi*f*t_samp);
subplot(4,1,3);
stem(n, x_samp2);
title('Critical Sampling (fs = 10 Hz)');
xlabel('n'); ylabel('x[n]'); grid on; axis([0 5 -1 1]);
fs = 50;
Ts = 1/fs;
t_samp = 0:Ts:duration;
n = 0:length(t_samp)-1;
x_samp3 = cos(2*pi*f*t_samp);
subplot(4,1,4);
stem(n, x_samp3, 'r', 'filled');
title('Over-Sampling (fs = 50 Hz)');
xlabel('n'); ylabel('x[n]'); grid on; axis([0 20 -1 1]);axis padded;
figure;
% Original signal
subplot(4,1,1);
plot(t_cont, x_cont, 'k', 'LineWidth', 1.5);
title('Original Continuous Signal (1s)');
xlabel('t'); ylabel('x(t)'); grid on; axis([0 1 -1 1]); axis padded;
Ts = 1;
t_samp = 0:Ts:duration;
x_recon = zeros(size(t_cont));
for n = 1:length(t_samp)
   x_recon = x_recon + x_samp1(n) * sinc((t_cont - t_samp(n)) / Ts);
end
subplot(4,1,2);
plot(t_cont, x_recon, 'b', 'LineWidth', 1.5);
title('Reconstructed (Under-Sampling, fs = 2 Hz)');
xlabel('t'); ylabel('x(t)'); grid on; axis([0 1 -1 1]);
Ts = 0.5;
t_samp = 0:Ts:duration;
x_recon = zeros(size(t_cont));
for n = 1:length(t_samp)
   x_recon = x_recon + x_samp2(n) * sinc((t_cont - t_samp(n)) / Ts);
end
subplot(4,1,3);
plot(t_cont, x_recon, 'b', 'LineWidth', 1.5);
title('Reconstructed (Critical Sampling, fs = 10 Hz)');
xlabel('t'); ylabel('x(t)'); grid on; axis([0 1 -1 1]);
Ts = 0.05;
t_samp = 0:Ts:duration;
x_recon = zeros(size(t_cont));
for n = 1:length(t_samp)
   x_recon = x_recon + x_samp3(n) * sinc((t_cont - t_samp(n)) / Ts);
end
subplot(4,1,4);
plot(t_cont, x_recon, 'b', 'LineWidth', 1.5);
title('Reconstructed (Over-Sampling, fs = 50 Hz)');
xlabel('t'); ylabel('x(t)'); grid on; axis([0 1 -1 1]); axis padded;%%