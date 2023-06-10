clc, clearvars

filename="monthly_in_situ_co2_mlo.csv";
TABLE=readtable(filename);

T = [ TABLE.Date_1(5:787) ];  % T ska vara en vektor med tiden för olika C02 mätningar
y = [ TABLE.CO2(5:787) ];  % y ska vara en vektor med data från CO2 mätningar 

plot(T, y);
axis([1950, 2025, 300, 450]);
grid on;

hold on;

% Construct the coefficient matrix
X = [T.^2, T, ones(size(T))];

coefficients = X \ y;

a = coefficients(1);
b = coefficients(2);
c = coefficients(3);

curve_x = linspace(min(T), max(T), 100);
curve_y = a * curve_x.^2 + b * curve_x + c;

plot(curve_x, curve_y);
title('Keeling Curve and Fitted Quadratic Curve');