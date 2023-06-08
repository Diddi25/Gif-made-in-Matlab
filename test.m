clc, clearvars

nList = [3, 30, 300, 3000];

I = eye(3)

%R = rand(3)
% Define the range
lower_bound = 0.001;
upper_bound = 0.01;

% Generate a vector of random numbers within the specified range
R = lower_bound + (upper_bound - lower_bound) * rand(3);


S = sum(R)


k1 = 1 ./ S

k2 = 0.5

k3 = (1 ./ S) - 0.01

k4 = 1000

k5 = 1/R(:, 3)

k6 = 0.00008


S = sum(R)

C = k4*R;

A = I - C;



