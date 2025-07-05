clc
clear all
a = 1;                          
t = linspace(-10, 10, 1000);        
omega = linspace(-100, 100, 1000);  
x_t = (t <= 0) .* exp(a * t);    
dt = t(2) - t(1);
X_j = zeros(size(omega));
for k = 1:length(omega)
   X_j(k) = sum(x_t.*exp(-1j*omega(k)*t))*dt;
end
domega = omega(2) - omega(1);
x_synthesized = zeros(size(t));
for k = 1:length(t)
   x_synthesized(k)=(1/(2*pi))*sum(X_j.*exp(1j*omega*t(k)))*domega;
end
figure;
subplot(4,1,1);
plot(t, x_t, 'black', 'LineWidth', 1.5);
axis([-10 10 -0.5 1.5])
yticks([-0.5:0.5:1.5])
title('CT Aperiodic input siganl');
xlabel('Time (t)');
ylabel('x(t)');
grid on;
subplot(4,1,2);
plot(omega, abs(X_j), 'black', 'LineWidth', 1.5);
axis([-10 10 -0.5 1.5])
yticks([-0.5:0.5:1.5])
title('Magnitude spectrum');
xlabel('Ω(rad/s)');
ylabel('x(jΩ)');
grid on;
subplot(4,1,3);
plot(omega, angle(X_j), 'black', 'LineWidth', 1.5);
axis([-10 10 -2 2])
yticks([-2:1:2])
 
title('Phase spectrum');
xlabel('Ω(rad/s)');
ylabel('<x(jΩ)(radians)');
grid on;
subplot(4,1,4);
plot(t, real(x_synthesized), 'black', 'LineWidth', 1.5);
axis([-10 10 -0.5 1.5])
yticks([-0.5:0.5:1.5])
title('Synthesized Signal from Inverse Fourier Transform');
xlabel('Time (t)');
ylabel('x(t)');
grid on;