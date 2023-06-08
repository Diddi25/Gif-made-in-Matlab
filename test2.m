clc, clearvars

tic;  % Start the stopwatch timer

% Perform some computations or execute code
sum = 0;
for i = 1:1000000
    sum = sum + i;
end

elapsed_time = toc;  % Stop the stopwatch timer and get the elapsed time
disp(['Elapsed time: ', num2str(elapsed_time), ' seconds']);

B = rand(1, 3); % Generate a row vector of random numbers
% Generate a column vector of random numbers

x = 1:10;  % x-coordinates
y = [2 4 6 8 10 8 6 4 2 0];  % y-coordinates
plot(x, y)


scatter(1:1, elapsed_time)