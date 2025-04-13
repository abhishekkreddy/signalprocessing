% Define the time-domain signal
x = [1, 2, 3, 4];  % Example signal
N = length(x);     % Number of samples

% Initialize the DFT result
X = zeros(1, N);

% Compute the DFT
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
end

% Display the magnitude and phase
magnitude = abs(X);
phase = angle(X);

% Plotting
figure;
subplot(2,1,1);
stem(0:N-1, magnitude);
title('DFT Magnitude');
xlabel('Frequency Index k');
ylabel('|X[k]|');

subplot(2,1,2);
stem(0:N-1, phase);
title('DFT Phase');
xlabel('Frequency Index k');
ylabel('Angle(X[k])');
