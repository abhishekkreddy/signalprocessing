% To Understand what a LTI system is
% Author: Abhishek 
% LTI (Linear & Time-Invariant)	- Linear system (superposition property) and time-invariant (output shifts with input shift)
% Causal - Output at time  t depends only on current or past inputs, not future inputs
% Memoryless  -	Output depends only on current input, not past or future inputs
% Stable (BIBO) -  For bounded inputs, the output remains bounded
% Invertible  -  There exists an inverse system to recover the input from the output


% Define input signal (e.g., a simple impulse)
x = [1, zeros(1, 9)];

% Define a simple LTI system (FIR filter)
h = [0.5, 0.5];  % Impulse response of the system

% Output (convolution of input and impulse response)
y = conv(x, h, 'same');

% Plot input and output
subplot(2,1,1);
stem(x, 'filled');
title('Input Signal');

subplot(2,1,2);
stem(y, 'filled');
title('Output Signal (after passing through system)');
