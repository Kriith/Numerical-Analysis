% Solution to a problem to tone down the snare dums by 25%
% Frequency Range of snare drum is given to be 150-250 Hz

clear all;
clc;

[a, fs] = audioread("i_hope_i_don't_lose_my_job.wav");

n = length(a);
b = fftshift(fft(a));           % Fourier Transform of the input audiofile
x = (-n/2 : 1 : n/2-1) * fs;
w = (-n/2 : 1 : n/2-1).*(fs/n);

figure(1)
plot(x, abs(a));                % Plot of Amplitude of the inital audiofile

figure(2)
plot(w, abs(b));                % Plot of Frequency vs Fourier Transform of initial audiofile

n_150 = floor(150*n/(fs));
n_250 = floor(250*n/(fs));

for i = floor(n/2 - n_250) : floor(n/2 - n_150)
  b(i) = b(i)*0.75;
end
for i = floor(n/2 + n_150) : floor(n/2 + n_250)
  b(i) = b(i) * 0.75;
end;

figure(3)
plot(w, abs(b));                % Plot of Frequency vs Fourier Transform of final audiofile

c = ifft(ifftshift(b));         % Inverse Fourier Transform

figure(4)
plot(x, abs(c));                % Plot of Amplitude of the final audiofile

audiowrite("thankyou_for_saving_my_job.wav", c, fs);
