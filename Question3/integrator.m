clc;
clear all;
close all;

low=0;              %starting value
hi=1000;         %ending value
h=(hi-low)/10000000;   %step size
area = 0;           %initializing area value
ct=0;               %initializing counter

myfunction=@(x) x/(exp(x)+1);

while(low<=hi);     %in range
    y=myfunction(low);  %get y for f(x) and f(x+h)
    y1=myfunction(low+h);
    if(y>y1)    %if f(x) is greater than f(x+h)
        area = area+((y-y1)*0.5*h); %area of triangle function makes
        area = area+y1*h;       %area of rectangle under triangle
    end
    
    if(y1>y)        %if f(x+h) is greater than f(x)
        area = area+((y1-y)*0.5*h);%area of triangle function makes
        area = area+y*h;%area of rectangle under triangle
    end
    low=low+h;  %low increment
end
pie = sqrt(12*area); %calculate pi from intergration
fprintf('Our estimate for pi came to %0.12f \n', pie);
fprintf('Pi is equal to %0.12f \n', pi);
PerDiff=abs(pi-pie)*100; %calculating difference between the calculated value of pi
                        %and the actual valie of pi
fprintf('Our percentage error is %0.10f%', PerDiff);
