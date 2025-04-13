

%code for convolution implementation


x = [1 2 3 4 5];
h = [5 4 3 2 1];

N = length(x) + length(h) - 1;

% y(n) = k = 0 to length(x) -1 x(k)h(n-k)

for n = 1:N
    for k = 1:length(x)-1
        y(n) = x(k)*h(n-k);
    end
end
y