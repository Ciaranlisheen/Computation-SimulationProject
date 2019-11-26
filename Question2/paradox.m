clear
%Random Number Generator Conditions
a = 16807;
c = 0;
m = 2147483647;
temp = clock();
X = round(temp(6));
X = mod(X, m);

N = 30; %sample size
%birthdays = zeros(N,0); %createing an array of zeros to add birthdays 
probability = zeros(N,0); %array of zeros to store probabilities for each sample size
counter =0; %counter for amount of times a smaple size has a shared birthday
z = 1000; %repeat test for each sample size z times
for x = 1:N %this loop is to create an array of probabilities for sample size from 0 to N
    for j = 1:z % this loop just repeats the test for each sample size x so we can calculate a proability
        birthdays = zeros(N,0); %creates an array of zeros of length N 
        for i = 1:x %this loop assigns random birthdays for sample size x
            X = mod(a*X +c, m);%generate random numbers as per above conditions
            birthdays(i) = mod(X, 365) + 1;%assign each spot in the array to a random number
        end
        if((length(birthdays)) > (length(unique(birthdays)))) %if theres a shared birthday in the birthday array
            counter = counter + 1;                            %increment the probability counter
        end
    end
    probability(x) = counter/z; %calculate the probability for sample size x and store it in 
                                % index x in proability array 
    counter = 0;
end


x=1:N;
plot(x, probability) %plot the probaility against sample size
ylabel('Probability of Picking Someone with a Shared Birthday')
xlabel('Sample Size (number of people in the room)')
title('Birthday Paradox')