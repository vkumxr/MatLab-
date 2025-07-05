clc;
clear;
close all;

% 1. Define the time range
n = -6:6; % Time vector from -6 to 6

% 2. Define the input signal
x = [0 0 0 1 1 1 1 1 1 0 0 0 0]; % Example: a sequence with ones between -2 to 2

% 3. Compute the Fourier Transform (DTFT)
w = linspace(-pi, pi, 500); % frequency range
X = zeros(size(w)); % initialize Fourier Transform

for k = 1:length(w)
    X(k) = sum(x .* exp(-1j * w(k) * n));
end

% 4. Synthesize the signal using Inverse DTFT
x_rec = zeros(size(n)); % initialize reconstructed signal

for idx = 1:length(n)
    x_rec(idx) = (1/(2*pi)) * trapz(w, X .* exp(1j * w * n(idx)));
end

% 5. Plot the input signal, Fourier Transform and synthesized signal

% Plot input signal
figure;
stem(n, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot magnitude and phase of Fourier Transform
figure;
subplot(2,1,1);
plot(w, abs(X));
title('Magnitude of X(e^{j\omega})');
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(w, angle(X));
title('Phase of X(e^{j\omega})');
xlabel('\omega');
ylabel('Angle (radians)');
grid on;

% Plot synthesized signal
figure;
stem(n, real(x_rec), 'filled'); % Taking real part because small imaginary errors may appear
title('Synthesized Signal x_{rec}[n]');
xlabel('n');
ylabel('Amplitude');
grid on;