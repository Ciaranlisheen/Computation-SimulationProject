clear
%Random Number Generator Conditions
a = 16807;
c = 0;
m = 2147483647;
temp = clock();
X = round(temp(6));
X = mod(X, m);

Fs = 1000; % Samples per second
toneFreq = 261.63; % Tone frequency, in Herts
nSeconds = 0.1; % Duration of the sound

for i = 1:90
X = mod(a*X +c, m); %new random number every loop
toneFreq = X; %new toneFreq every loop
y = sin(1000*linspace(0, nSeconds*toneFreq*2*pi, round(nSeconds*Fs)));
sound(y, Fs); % Play sound at sampling rate Fs
pause(nSeconds); %pause loop for nSeconds so sounds dont start to overlap
end