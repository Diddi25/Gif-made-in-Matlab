clc, clearvars

filename="monthly_in_situ_co2_mlo.csv";
TABLE=readtable(filename);

T = [ TABLE.Date_1(5:787) ];  % T ska vara en vektor med tiden för olika C02 mätningar
y = [ TABLE.CO2(5:787) ];  % y ska vara en vektor med data från CO2 mätningar 

% Initialize an empty vector
onlyOnesVector = [];

% Loop to add element 1
for i = 1:length(T)
 
    newElement = 1;
    
    onlyOnesVector(i, 1) = newElement;

end

newMatrix = [T, onlyOnesVector];

x = mldivide(newMatrix, y);

k = x(1);
m = x(2);

myFunc = k*T + m;

plot(T, myFunc);


axis([1950, 2025, 300, 450]);
title('Keeling Curve and Fitted Linear Curve');
grid on;

hold on;

plot(T, y)



