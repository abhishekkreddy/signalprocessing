% Define the input signal
x = [0 1 2 3 4];
N = length(x);
X = zeros(1, N);  % Initialize the DFT result

% Compute the DFT
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
end

% Display the DFT result
disp('DFT of the signal:');
disp(X);

% Compute the IDFT
x_reconstructed = zeros(1, N);  % Initialize the reconstructed signal

for n = 0:N-1
    for k = 0:N-1
        x_reconstructed(n+1) = x_reconstructed(n+1) + X(k+1) * exp(1i * 2 * pi * k * n / N);
    end
    x_reconstructed(n+1) = x_reconstructed(n+1) / N;
end

% Display the reconstructed signal
disp('Reconstructed signal from IDFT:');
disp(x_reconstructed);

% Compute DFT using FFT
X_fft = fft(x);

% Compute IDFT using IFFT
x_ifft = ifft(X_fft);
