clear all;
clc;
f1=figure;
t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-0.5 && t<=0.5)
        x(i)=t+0.5;
    else if(t>0.5 && t<=1.5)
            x(i)=1.5-t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,1)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(t)');
title('CT basic function');

t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>=1.5 && t<=2.5)
        x(i)=t-1.5;
    else if(t>2.5 && t<=3.5)
            x(i)=-t+3.5;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,2)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(t-2)');
title('CT shifting(delay) function');

t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-2.5 && t<=-1.5)
        x(i)=t+2.5;
    else if(t>-1.5 && t<=-0.5)
            x(i)=-0.5-t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,3)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(t+2)');
title('CT shifting(advance)function');

f2=figure;
t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-0.5 && t<=0.5)
        x(i)=t+0.5;
    else if(t>0.5 && t<=1.5)
            x(i)=1.5-t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,1)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(t)');
title('CT basic function');

t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-0.25 && t<=0.25)
        x(i)=2*t+0.5;
    else if(t>0.25 && t<=0.75)
            x(i)=1.5-2*t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,1)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(2t)');
title('CT scaling(compress) function');


t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-1 && t<=1)
        x(i)=0.5*t+0.5;
    else if(t>1 && t<=3)
            x(i)=1.5-0.5*t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,2)
plot(t,x)
axis([-3 4 -2 2]);
xlabel('t');
ylabel('x(0.5t)');
title('CT scaling(expand) function');

t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-0.5 && t<=0.5)
        x(i)=-t+0.5;
    else if(t>-1.5 && t<=-0.5)
            x(i)=1.5+t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,3)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(-t)');
title('CT reverse function');

f3=figure;
t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-0.5 && t<=0.5)
        x(i)=t+0.5;
    else if(t>0.5 && t<=1.5)
            x(i)=1.5-t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,1)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(t)');
title('CT basic function');

t=-5:0.01:5;
x=zeros(1,length(t));
i=1;
for t=-5:0.01:5
    if(t>-0.5 && t<=0.5)
        x(i)=-t+0.5;
    else if(t>-1.5 && t<=-0.5)
            x(i)=1.5+t;
    else
        x(i)=0;
    end
  end
  i=i+1;
end
t=-5:0.01:5;
subplot(3,1,2)
plot(t,x)
axis([-3 3 -2 2]);
xlabel('t');
ylabel('x(-t)');
title('CT reverse function');

f4=figure;
t=-5:5;
x=zeros(1,length(t));
i=1;
for t=-5:5
    if(t>=0 && t<4)
        x(i)=t+1;
    else if(t==-1)
            x(i)=1;
    else if(t==4)
            x(i)=1;
    else
        x(i)=0;
    end
    end
  end
  i=i+1;
end
t=-5:5;
subplot(3,1,1)
stem(t,x)
axis([-3 5 -1 5]);
xlabel('n');
ylabel('x(n)');
title('DT basic function');


t=-5:5;
x=zeros(1,length(t));
i=1;
for t=-5:5
    if(t>-2 && t<0)
        x(i)=abs(t)+1;
    else if(t>=0 && t<2)
        x(i)=t+3;
    else if(t==-3)
            x(i)=1;
    else if(t==2)
            x(i)=1;
     else if(t==-2)
            x(i)=1;
    else
        x(i)=0;
     end
    end
    end
    end
  end
  i=i+1;
end
t=-5:5;
subplot(3,1,3)
stem(t,x)
axis([-4 5 -1 5]);
xlabel('n');
ylabel('x(n+2)');
title('DT shifting(advance) function');

t=-5:5;
x=zeros(1,length(t));
i=1;
for t=-5:5
    if(t>=1 && t<=4)
        x(i)=t;
    else if(t==5)
            x(i)=1;
     else if(t==0)
            x(i)=1;
    else
        x(i)=0;
     end
    end
    end
  i=i+1;
end
t=-5:5;
subplot(3,1,2)
stem(t,x)
axis([-2 6 -1 5]);
xlabel('n');
ylabel('x(n-1)');
title('DT shifting(delay) function');

f5=figure;
t=-5:5;
x=zeros(1,length(t));
i=1;
for t=-5:5
    if(t>=0 && t<4)
        x(i)=t+1;
    else if(t==-1)
            x(i)=1;
    else if(t==4)
            x(i)=1;
    else
        x(i)=0;
    end
    end
  end
  i=i+1;
end
t=-5:5;
subplot(3,1,1)
stem(t,x)
axis([-3 5 -1 5]);
xlabel('n');
ylabel('x(n)');
title('DT basic function');
t=-10:10;
x=zeros(1,length(t));
i=1;
for t=-10:10
    if(t==-1 || t==1 || t==3 || t==5 || t==7)
        x(i)=0;
    else if(t==-2 || t==0 || t==8 )
            x(i)=1;
    else if(t==2 || t==4 || t==6)
            x(i)=(t/2)+1;
    else
        x(i)=0;
     end
    end
    end
  i=i+1;
end
t=-10:10;
subplot(3,1,2)
stem(t,x)
axis([-3 10 -1 5]);
xlabel('n');
ylabel('x(0.5n)');
title('DT scaling(expand) function');


t=-5:5;
x=zeros(1,length(t));
i=1;
for t=-5:5
    if(t==0)
        x(i)=1;
    else if(t==1)
            x(i)=3;
     else if(t==2)
            x(i)=1;
    else
        x(i)=0;
     end
    end
    end
  i=i+1;
end
t=-5:5;
subplot(3,1,3)
stem(t,x)
axis([-2 6 -1 5]);
xlabel('n');
ylabel('x(2n)');
title('DT scaling(compress) function');

f6=figure;
t=-5:5;
x=zeros(1,length(t));
i=1;
for t=-5:5
    if(t>=0 && t<4)
        x(i)=t+1;
    else if(t==-1)
            x(i)=1;
    else if(t==4)
            x(i)=1;
    else
        x(i)=0;
    end
    end
  end
  i=i+1;
end
t=-5:5;
subplot(2,1,1)
stem(t,x)
axis([-3 5 -1 5]);
xlabel('n');
ylabel('x(n)');
title('DT basic function');

t=-5:5;
x=zeros(1,length(t));
i=1;
for t=-5:5
    if(t<=0 && t>-4)
        x(i)=abs(t)+1;
    else if(t==1)
            x(i)=1;
    else if(t==-4)
            x(i)=1;
    else
        x(i)=0;
    end
    end
  end
  i=i+1;
end
t=-5:5;
subplot(2,1,2)
stem(t,x)
axis([-5 2 -1 5]);
xlabel('n');
ylabel('x(-n)');
title('DT reversing function')