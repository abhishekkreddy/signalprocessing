% MATLAB Script: First Difference and Running Sum with Various Signals

% Time index
n = 0:20;

% Define various signals
x1 = ones(size(n));                      % Constant signal
x2 = n;                                  % Ramp signal
x3 = sin(2*pi*0.1*n);                    % Sine wave
x4 = [zeros(1,5), ones(1,5), zeros(1,11)]; % Step signal
x5 = [zeros(1,10), 1, zeros(1,10)];      % Impulse signal

% Store signals in a cell array for iteration
signals = {x1, x2, x3, x4, x5};
signal_names = {'Constant', 'Ramp', 'Sine Wave', 'Step', 'Impulse'};

% Loop through each signal
for i = 1:length(signals)
    x = signals{i};
    
    % Compute first difference
    first_diff = [0, diff(x)];
    
    % Compute running sum
    running_sum = cumsum(x);
    
    % Plotting
    figure;
    subplot(3,1,1);
    stem(n, x, 'filled');
    title([signal_names{i} ' Signal']);
    xlabel('n');
    ylabel('x[n]');
    grid on;
    
    subplot(3,1,2);
    stem(n, first_diff, 'filled');
    title('First Difference');
    xlabel('n');
    ylabel('x[n] - x[n-1]');
    grid on;
    
    subplot(3,1,3);
    stem(n, running_sum, 'filled');
    title('Running Sum');
    xlabel('n');
    ylabel('Cumulative Sum');
    grid on;
end

% Constant Signal:
% 
% First Difference: Zero everywhere, since there's no change between samples.
% 
% Running Sum: Linearly increasing, as the constant value accumulates over time.
% 
% Ramp Signal:
% 
% First Difference: Constant value, representing the consistent increase between samples.
% 
% Running Sum: Quadratic growth, as each term adds a larger value than the previous.
% 
% Sine Wave:
% 
% First Difference: Another sine wave, phase-shifted, highlighting the rate of change.
% 
% Running Sum: A waveform that integrates the sine wave, resulting in a cosine-like shape.
% 
% Step Signal:
% 
% First Difference: Impulse at the point of transition, indicating a sudden change.
% 
% Running Sum: Remains at zero until the step, then increases linearly.
% 
% Impulse Signal:
% 
% First Difference: Impulse at the point of occurrence and negative impulse immediately after.
% 
% Running Sum: Zero until the impulse, then maintains the impulse value.
% 

