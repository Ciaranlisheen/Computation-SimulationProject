clear
%Random Number Generator Conditions
a = 16807;
c = 0;
m = 2147483647;
temp = clock();
X = round(temp(6));
X = mod(X, m);

counter = 0; %counter for points that fall inside circle of radius 1
N = 1000000; %sample size

xpoints = zeros(N, 0);
ypoints = zeros(N, 0);

for i = 1:N
    X = mod(a*X +c, m); %random number
    X1 = X  - (m/2); %gives random number between m/2 and -m/2
    if(X1 > 0)              %if x1 is greater than zero its period can be
        X2 = X1/((m/2)-1);  %(m/2)-1 so we divide by this so x2 is now a real number
    else                %if x1 is less than zero its period can be
        X2 = X1/(m/2);  %(m/2) so we divide by this so x2 is now a real number
    end
    xpoints(i) = X2;   %create an array for X Component of the Points 
end

for i = 1:N         % this for loop works the same as the above for the point assigment
    X = mod(a*X +c, m);
    X1 = X  - (m/2);
    if(X1 > 0)
        X2 = X1/((m/2)-1);
    else
        X2 = X1/(m/2);
    end
    ypoints(i) = X2;    %create an array for the Y components of the Points
    
    if((sqrt(xpoints(i).^2 + ypoints(i).^2)) <= 1) %if the distance from 0,0 to a point is less than 1 
        counter = counter+1;                       %it falls inside the circle of radius 1 therefore increment the counter
    end
end

pi = counter/(N*0.25)%calculation of pi according to the formula