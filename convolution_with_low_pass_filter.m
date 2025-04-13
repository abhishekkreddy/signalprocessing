% MATLAB Script: Convolution with Low-Pass Filter
% Author Abhishek

% 1. Parameters
fs = 48000;            % Sampling frequency (Hz)
t = 0:1/fs:1-1/fs;     % Time vector (1 second duration)

% 2. Generate composite signal: 1 kHz + 15 kHz sine waves
f1 = 1000;             % Frequency of first sine wave (Hz)
f2 = 15000;            % Frequency of second sine wave (Hz)
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);  % Composite signal

% 3. Design low-pass FIR filter with 6 kHz cutoff
fc = 6000;             % Cutoff frequency (Hz)
N = 64;                % Filter order (number of taps - 1)
h = fir1(N, fc/(fs/2));  % Normalized cutoff frequency (0 to 1)

% 4. Apply filter using convolution
y = conv(x, h, 'same');  % 'same' returns output of same length as input

% 5. Plot time-domain signals
figure;
subplot(2,1,1);
plot(t, x);
title('Original Signal (1 kHz + 15 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, y);
title('Filtered Signal (After Low-Pass Filter)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 6. Plot frequency-domain signals
nfft = 1024;
X = fft(x, nfft);
Y = fft(y, nfft);
f = fs*(0:(nfft/2)-1)/nfft;

figure;
subplot(2,1,1);
plot(f, abs(X(1:nfft/2)));
title('Original Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(2,1,2);
plot(f, abs(Y(1:nfft/2)));
title('Filtered Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
