clc, clearvars

% Create a figure and plot some data
figure;
plot(1:10);

% Update the plot in a loop
for i = 1:10
    % Modify the plot
    plot(i:i+10);
    axis([0, 13, 0, 22]);
    
    % Refresh the figure window
    drawnow;
    
    % Pause for a short duration to observe the updates
    pause(0.5);
end
