clc;
clear all;

figure(1);
n=0:3;
x=[2,3,1,5];
subplot(2,1,1)
stem(n,x,'filled','linewidth',2);
title('DT SIGNAL');
xlabel('n');
ylabel('x[n]');
axis([-1 5 0 10])
i=1;
X=0;
syms z;
for n=0:3
   X=X+x(i)*z^(-n);
   i=i+1; 
end
[N,D]=numden(X);
Nr=sym2poly(N); 
Dr=sym2poly(D);
subplot(2,1,2)
zplane(Nr,Dr);
r=iztrans(X);
disp(r);