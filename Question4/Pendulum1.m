clc;
clear;
close all;

g=9.8;
l=2;
w = sqrt(9.8/2);

y_start = 5;
dy_start = (g/l)*cos(y_start);

h=0.001;
x=0:h:10;
y = zeros(1,length(x)); 
yapprox = zeros(1,length(x)); 
dy = zeros(1,length(x));

for i=1:(length(x)-1)                              % calculation loop
    
    if(i==1)
       A1 = func(y_start);
       A2 = func(y_start+(h/2)*(dy_start+(h/4)*A1));
       A3 = func(y_start+(h/2)*(dy_start+(h/4)*A1));
       A4 = func(y_start+h*(dy_start+(h/2)*A3));
       
       y(i) = y_start+h*(dy_start+1/6*(A1+A2+A3));
       dy(i) = dy_start + (h/6)*(A1+2*A2+2*A3+A4);
    end
    
       A1 = func(y(i));
       A2 = func(y(i)+(h/2)*(dy(i)+(h/4)*A1));
       A3 = func(y(i)+(h/2)*(dy(i)+(h/4)*A1));
       A4 = func(y(i)+h*(dy(i)+(h/2)*A3));
       
       y(i+1) = y(i)+h*(dy(i)+1/6*(A1+A2+A3));
       dy(i+1) = dy(i) + (h/6)*(A1+2*A2+2*A3+A4);
       y1(i+1) = 30*cos(w*x(i));
    
end

figure(1)
plot(x, y);

figure(2)
plot(x, y1);



