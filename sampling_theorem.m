% Sampling Theorem Demonstration in MATLAB
% Author: Abhishek 
% This code demonstrates the Sampling Theorem with the following concepts:
% 1. Continuous-time signal
% 2. Sampling at Nyquist rate (2 * f_max)
% 3. Undersampling (aliasing occurs)
% 4. Visualization of sampled signals and aliasing

%% Theory
% Sampling Theorem (Nyquist-Shannon Theorem):
% - To accurately represent a continuous signal in digital form, the sampling rate (f_s) must be at least twice the maximum frequency (f_max) present in the signal.
% - If f_s >= 2 * f_max, the signal can be perfectly reconstructed.
% - If f_s < 2 * f_max, aliasing occurs, and high-frequency components fold back into the lower frequencies.

% In this example, we will:
% - Create a continuous sinusoidal signal with frequency 10 Hz.
% - Sample it at the Nyquist rate (20 Hz).
% - Show the effects of undersampling at 10 Hz (aliasing).

%% 1. Continuous-Time Signal (Cosine Wave)
t_continuous = 0:0.001:1;  % Time vector for continuous signal (high resolution)
f = 10;  % Frequency of the sine wave (10 Hz)
x_continuous = cos(2 * pi * f * t_continuous);  % Continuous sine wave signal

% Plot continuous signal
figure;
plot(t_continuous, x_continuous, 'b-', 'LineWidth', 1.5);
title('Continuous-Time Sine Wave');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;

%% 2. Sampling at Nyquist Rate (f_s = 2 * f_max)
f_s = 10 * f;  % Sampling frequency at Nyquist rate (20 Hz)
t_sampled = 0:1/f_s:1;  % Sampling points (sampling rate = 20 Hz)
x_sampled = cos(2 * pi * f * t_sampled);  % Sampled signal at Nyquist rate

% Plot continuous signal and sampled signal at Nyquist rate
figure;
plot(t_continuous, x_continuous, 'b-', 'LineWidth', 1.5);  % Continuous signal
hold on;
stem(t_sampled, x_sampled, 'r', 'LineWidth', 1.5);  % Sampled signal
title('Signal Sampled at Nyquist Rate (f_s = 20 Hz)');
xlabel('Time (t)');
ylabel('Amplitude');
legend('Continuous Signal', 'Sampled Signal');
grid on;

%% 3. Undersampling (f_s < 2 * f_max, Aliasing)
f_s_alias = f;  % Undersampling frequency (below Nyquist rate, 10 Hz)
t_sampled_alias = 0:1/f_s_alias:1;  % Sampling points (sampling rate = 10 Hz)
x_sampled_alias = cos(2 * pi * f * t_sampled_alias);  % Sampled signal with aliasing

% Plot continuous signal and undersampled signal
figure;
plot(t_continuous, x_continuous, 'b-', 'LineWidth', 1.5);  % Continuous signal
hold on;
stem(t_sampled_alias, x_sampled_alias, 'r', 'LineWidth', 1.5);  % Undersampled signal
title('Signal Undersampled (Aliasing Occurs at f_s = 10 Hz)');
xlabel('Time (t)');
ylabel('Amplitude');
legend('Continuous Signal', 'Undersampled Signal');
grid on;

%% Explanation of Results
% 1. In the first plot, we see the continuous signal (cosine wave with 10 Hz frequency).
% 2. In the second plot, we sample the signal at the Nyquist rate (20 Hz), and the sampled points match the continuous signal.
% 3. In the third plot, we sample at 10 Hz, which is below the Nyquist rate. This causes aliasing, and the sampled signal no longer accurately represents the original sine wave.
%    The frequency of the undersampled signal appears as a lower frequency due to aliasing.

%% Code Summary:
% - The continuous signal is generated using a high-resolution time vector.
% - The signal is then sampled at the Nyquist rate (2 * f_max).
% - Aliasing is demonstrated by undersampling below the Nyquist rate.
% - The `stem()` function is used to show the discrete samples of the signal.
% - The `plot()` function is used to visualize both the continuous and discrete signals.

%% Key Takeaways:
% - If the sampling rate is below the Nyquist rate (2 * f_max), aliasing will occur.
% - To avoid aliasing and accurately reconstruct the signal, the sampling rate must be at least twice the maximum frequency in the signal.
% - In real-world applications, anti-aliasing filters are often used before sampling to remove high-frequency components that could cause aliasing.

