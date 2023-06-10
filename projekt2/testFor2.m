
clc, clearvars

filename="monthly_in_situ_co2_mlo.csv";
TABLE=readtable(filename);

% columnNames = TABLE.Properties.VariableNames;
% disp(columnNames);

T = [ TABLE.Date_1 ];  % T ska vara en vektor med tiden för olika C02 mätningar
y = [ TABLE.CO2 ];  % y ska vara en vektor med data från CO2 mätningar 

plot(T, y)
ylim([300, 450]);
grid on;