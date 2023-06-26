clc, clearvars

filename="monthly_in_situ_co2_mlo.csv";
TABLE=readtable(filename);

T = [ TABLE.Date_1(5:787) ];  % T ska vara en vektor med tiden för olika C02 mätningar
y = [ TABLE.CO2(5:787) ];  % y ska vara en vektor med data från CO2 mätningar 

% Construct the coefficient matrix
X = [T.^2 T ones(size(T)) ];
%[ ones(size(T)) T T.^2 ];

coefficients = X \ y;

a = coefficients(1);
b = coefficients(2);
c = coefficients(3);

%curve_x = linspace(min(T), max(T), 100);
y2 = a * T.^2 + b * T + c;

plot(y2);
title('Keeling Curve and Fitted Quadratic Curve');

hold on;

plot(T, y);
axis([1950, 2025, 300, 450]);
grid on;