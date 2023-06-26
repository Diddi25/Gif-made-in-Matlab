
clc, clearvars

filename="monthly_in_situ_co2_mlo.csv";
TABLE=readtable(filename);

T = [ TABLE.Date_1(79:787)];  % T ska vara en vektor med tiden för olika C02 mätningar
y = [ TABLE.CO2(79:787)];  % y ska vara en vektor med data från CO2 mätningar 

X = [T.^2, T, ones(size(T))];


coefficients = X \ y;

a = coefficients(1);
b = coefficients(2);
c = coefficients(3);

y2 = a * T.^2 + b * T + c;

plot(T, y, T, y2);
axis([1962, 2025, 312, 430]);
title('quadratic curve');
grid on;
