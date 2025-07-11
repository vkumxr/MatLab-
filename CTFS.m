clc;
clear;
close all;
T = 2;
f = 1 / T;
t = -5:0.01:5;
x_t = square(2 * pi * f * t);
N_max = 128;
k_range = -N_max:N_max;
Ck = zeros(1, length(k_range));
t_one_period = linspace(0, T, 1000);
x_one_period = square(2 * pi * f * t_one_period);
for n = k_range
    exponential = exp(-1j * 2 * pi * n * f * t_one_period);
    integrand = x_one_period .* exponential;
    Ck(n + N_max + 1) = (1 / T) * trapz(t_one_period, integrand);
end
figure;
plot(t, x_t, 'r', 'LineWidth', 1.5);
title('Input Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;
figure;
k = -5:5;
stem(k, abs(Ck(k + N_max + 1)), 'b', 'LineWidth', 1.5);
title('Magnitude of a_k for k=-5:5');
xlabel('k');
ylabel('|a_k|');
disp(abs(Ck(k + N_max + 1)))
grid on;
figure;
stem(k, angle(Ck(k + N_max + 1)), 'b', 'LineWidth', 1.5);
title('Phase of a_k vs k for k=-5:5');
xlabel('k');
ylabel('Phase (radians)');
grid on;
figure;
k = -25:25;
stem(k, abs(Ck(k + N_max + 1)), 'b', 'LineWidth', 1.5);
title('Magnitude of a_k for k=-25:25');
xlabel('k');
ylabel('|a_k|');
grid on;
figure;
stem(k, angle(Ck(k + N_max + 1)), 'b', 'LineWidth', 1.5);
title('Phase of a_k vs k for k=-25:25');
xlabel('k');
ylabel('Phase (radians)');
grid on;
figure;
k = -50:50;
stem(k, abs(Ck(k + N_max + 1)), 'b', 'LineWidth', 1.5);
title('Magnitude of a_k for k=-50:50');
xlabel('k');
ylabel('|a_k|');
grid on;
figure;
stem(k, angle(Ck(k + N_max + 1)), 'b', 'LineWidth', 1.5);
title('Phase of a_k vs k for k=-50:50');
xlabel('k');
ylabel('Phase (radians)');
grid on;
N = 5;
x_recon = zeros(size(t));
for n = -N:N
    x_recon = x_recon + Ck(n + N_max + 1) * exp(1j * n * 2 * pi * f * t);
end
x_recon = real(x_recon);
figure;
plot(t, x_recon, 'b', 'LineWidth', 1.5);
title('Synthesized Signal (k=-5:5)');
xlabel('Time');
ylabel('Amplitude');
grid on;
N = 25;
x_recon = zeros(size(t));
for n = -N:N
    x_recon = x_recon + Ck(n + N_max + 1) * exp(1j * n * 2 * pi * f * t);
end
x_recon = real(x_recon);
figure;
plot(t, x_recon, 'b', 'LineWidth', 1.5);
title('Synthesized Signal (k=-25:25)');
xlabel('Time');
ylabel('Amplitude');
grid on;
N = 50;
x_recon = zeros(size(t));
for n = -N:N
    x_recon = x_recon + Ck(n + N_max + 1) * exp(1j * n * 2 * pi * f * t);
end
x_recon = real(x_recon);
[max_y, max_index] = max(x_recon);
t_peak = t(max_index);
figure;
plot(t, x_recon, 'b', 'LineWidth', 1.5);
title('Synthesized Signal (k=-50:50)');
hold on;
plot(t_peak, max_y, 'ro', 'LineWidth', 2)
xlabel('Time');
ylabel('Amplitude');
grid on;
hold off;
figure;
plot(t_one_period, x_one_period, 'r', 'LineWidth', 1.5);
title('One Time Period of Input Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;