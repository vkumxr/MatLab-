clc;
clear all;
close all;
fm = 5;
t = 0:0.00001:1;
x = sin(2*pi*fm*t);
fs_u = input('Enter value for undersampling (fs < 2fm): ');
fs_c = input('Enter value for critical sampling (fs = 2fm): ');
fs_o = input('Enter value for oversampling (fs > 2fm): ');
ts_u = 1/fs_u;
n1 = 0:10;
xs_u = sin(2*pi*fm*n1*ts_u);
ts_c = 1/fs_c;
n2 = 0:20;
xs_c = sin(2*pi*fm*n2*ts_c);
ts_o = 1/fs_o;
n3 = 0:fs_o;
xs_o = sin(2*pi*fm*n3*ts_o);
xrec_u = zeros(size(t));
xrec_c = zeros(size(t));
xrec_o = sinc_reconstruct(fs_o, xs_o, t); figure;
subplot(3,1,1);
plot(t, xrec_u, 'r', 'LineWidth', 2);
xlabel('t'); ylabel('x(t)');
title('Reconstructed from Undersampling (Expected: 0)');
subplot(3,1,2);
plot(t, xrec_c, 'b', 'LineWidth', 2);
xlabel('t'); ylabel('x(t)');
title('Reconstructed from Critical Sampling (Expected: 0)');
subplot(3,1,3);
plot(t, xrec_o, 'g', 'LineWidth', 2);
xlabel('t'); ylabel('x(t)');
title('Reconstructed from Oversampling');
figure;
subplot(4,1,2);
stem(n1, xs_u, 'r', 'LineWidth', 2);
xlabel('n'); ylabel('x1[n]');
title('UNDERSAMPLING (fs < 2fm)');
ylim([-1 1]);
subplot(4,1,3);
stem(n2, xs_c, 'b', 'LineWidth', 2);
xlabel('n'); ylabel('x2[n]');
title('CRITICAL SAMPLING (fs = 2fm)');
ylim([-1 1]);
subplot(4,1,4);
stem(n3, xs_o, 'g', 'LineWidth', 2);
xlabel('n'); ylabel('x3[n]');
title('OVERSAMPLING (fs > 2fm)');
ylim([-1 1]);
function xrec = sinc_reconstruct(fs, xs, t)
Ts = 1/fs;
n = 0:length(xs)-1;
xrec = zeros(size(t));
for k = 1:length(n)
xrec = xrec + xs(k) * sinc((t - n(k)*Ts)/Ts);
end
end
function y = sinc(x)
y = ones(size(x));
idx = x ~= 0;
y(idx) = sin(pi*x(idx))./(pi*x(idx));
end
subplot(4,1,1);
plot(t, x, 'g', 'LineWidth', 2);
xlabel('t'); ylabel('x(t)');
title('original signal')