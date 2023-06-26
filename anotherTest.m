clc, clearvars

filename="monthly_in_situ_co2_mlo.csv";
TABLE=readtable(filename);

T = [ TABLE.Date_1(79:787)];  % T ska vara en vektor med tiden för olika C02 mätningar
y = [ TABLE.CO2(79:787)];  % y ska vara en vektor med data från CO2 mätningar 

% Identify NaN elements
nanIndices = isnan(y);

% Remove NaN elements
TWithoutNaN = T(~nanIndices);
yWithoutNaN = y(~nanIndices);

X = [TWithoutNaN.^2, TWithoutNaN, ones(size(TWithoutNaN))];
coefficients = X \ yWithoutNaN;

a = coefficients(1);
b = coefficients(2);
c = coefficients(3);

y2 = a * TWithoutNaN.^2 + b * TWithoutNaN + c;

plot(TWithoutNaN, yWithoutNaN, TWithoutNaN, y2);
axis([1955, 2025, 300, 430]);
title('quadratic curve');
grid on;


