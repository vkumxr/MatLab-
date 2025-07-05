x_period = [1 1 -1 -1 ];  
N = length(x_period);  
cyc = 5;               
n=-cyc*N/2:cyc*N/2 -1
x = zeros(1, length(n));
for i = 1:length(n)
    x(i) = x_period(mod(n(i), N) + 1)
end

Xk = zeros(1, N);
for k = 0:N-1
    sum_val = 0;
    for m = 1:N
        sum_val = sum_val + x_period(m) * exp(-1j * 2 * pi * k * (m-1) / N);
    end

    Xk(k+1) = sum_val / N;
end
K_cycles = -cyc*N/2 : (cyc*N/2)-1;  
Xk_ext = zeros(1, length(K_cycles));
for i = 1:length(K_cycles)
    Xk_ext(i) = Xk(mod(K_cycles(i), N) + 1);
end
x_synthesized = zeros(1, length(n));
for idx = 1:length(n)
    sum_val = 0;
    for k = 0:N-1
        sum_val = sum_val + Xk(k+1) * exp(1j * 2 * pi * k * n(idx) / N);
    end
    x_synthesized(idx) = real(sum_val);  
end

subplot(4,1,1)
stem(n, x,'filled','linewidth',2)
axis([-11 11 -2 2]);
xticks(-11 :1: 11);
title('DT PERIODIC INPUT SIGNAL')
xlabel('n')
ylabel('x[n]')

subplot(4,1,2)
stem(K_cycles, abs(Xk_ext),'filled','linewidth',2)
axis([-11 11 0 1]);
xticks(-11 :1: 11);
yticks(0:0.2:1)
title('Magnitude Spectrum')
xlabel('n')
ylabel('|x[n]|')

subplot(4,1,3)
stem(K_cycles, angle(Xk_ext),'filled','linewidth',2)
axis([-11 11 -pi pi]);
xticks(-10:1:10);
yticks(-pi:pi/4:pi);
title('Phase Spectrum')
xlabel('n')
ylabel('angle x[n](radians)')

subplot(4,1,4)
stem(n, x_synthesized','filled','linewidth',2)
axis([-11 11 -2 2]);
xticks(-11 :1: 11);
title('Synthesized Signal from Fourier Series')
xlabel('n')
ylabel('x[n]')