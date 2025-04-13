clc; clear; close all;

%% --- Step 1: Define two simple signals ---
% Signal x[n] – rectangular pulse
x = [1 1 1];      
n1 = 0:length(x)-1;

% Signal h[n] – another rectangular pulse
h = [1 2 1];      
n2 = 0:length(h)-1;

%% --- Step 2: Manual convolution (for learning) ---
% Length of the convolution result
N = length(x) + length(h) - 1;

% Initialize output
y_manual = zeros(1, N);

% Manual convolution (using definition)
for n = 1:N
    for k = 1:length(x)
        if (n-k+1 > 0 && n-k+1 <= length(h))
            y_manual(n) = y_manual(n) + x(k) * h(n-k+1);
        end
    end
end

%% --- Step 3: Built-in convolution for comparison ---
y_builtin = conv(x, h);  % MATLAB's built-in convolution

%% --- Step 4: Plot all signals for understanding ---
figure;

subplot(3,1,1);
stem(n1, x, 'filled', 'r'); title('Input Signal x[n]'); xlabel('n'); ylabel('x[n]');
grid on;

subplot(3,1,2);
stem(n2, h, 'filled', 'b'); title('Impulse Response h[n]'); xlabel('n'); ylabel('h[n]');
grid on;

subplot(3,1,3);
n_out = 0:length(y_manual)-1;
stem(n_out, y_manual, 'filled', 'g'); hold on;
stem(n_out, y_builtin, 'ko');  % Compare manual vs built-in
title('Output y[n] = x[n] * h[n] (Convolution)');
xlabel('n'); ylabel('y[n]');
legend('Manual Convolution', 'Built-in conv()');
grid on;

%% --- Step 5: Theory Summary (Display in Command Window) ---
fprintf('\n--- Convolution Theory Summary ---\n');
fprintf('Convolution means combining two signals to get resultant signal, \ne.g how one signal x[n] is affected by h[n] to result to y[n]\n');
fprintf('1. Convolution is the process of flipping h[n], shifting it, multiplying, and summing.\n');
fprintf('2. y[n] = sum_{k=-inf}^{inf} x[k] * h[n-k]\n');
fprintf('3. Used to compute the output of LTI systems.\n');
fprintf('4. Length of output = length(x) + length(h) - 1\n');
fprintf('5. Manual convolution follows the definition, while conv() is built-in and efficient.\n');

