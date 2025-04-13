% Zadoff-Chu Correlation Example
% Author: Abhishek 
% This code simulates how frequency-domain correlation can estimate the CIR

% Parameters
N_ZC = 839;          % Zadoff-Chu sequence length
u = 25;              % Root index; must be coprime with N_ZC
delay_samples = 0;   % Artificial channel delay
delay_samples_1 = 0;
SNR_dB = 50;         % Signal-to-noise ratio in dB

% Step 1: Generate Zadoff-Chu sequence
n = 0:N_ZC-1;
zc_seq = exp(-1j * pi * u * n .* (n + 1) / N_ZC);
zc_seq_1 = exp(-1j * pi * u * n .* (n + 1) / N_ZC);
zc_seq_1 = circshift(zc_seq_1,838/2);

% Step 2: Create transmitted signal
tx = zc_seq + zc_seq_1;

% Step 3: Create received signal with delay and AWGN
rx = [zeros(1, delay_samples), tx];    % Add delay
rx = rx(1:N_ZC);                       % Truncate to original length
rx = rx + 10^(-SNR_dB/20)*(randn(1,N_ZC) + 1j*randn(1,N_ZC)); % Add noise

% Step 4: Frequency-domain correlation
TX = fft(tx);
RX = fft(rx);
corr_freq = RX .* conj(TX);
cir = ifft(corr_freq);  % Inverse FFT gives CIR (time-domain)

% Step 5: Plot
stem(0:N_ZC-1, abs(cir), 'filled');
xlabel('Sample Index'); ylabel('|CIR|');
title(['CIR using Zadoff-Chu, SNR = ', num2str(SNR_dB), ' dB']);
grid on;
