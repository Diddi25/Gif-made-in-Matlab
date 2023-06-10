%--------------------------------------------------------------------------
% IX1303-VT2023: PROJEKTUPPGIFT 2, CO2 mätning
%
% Detta är en template.
% Ni ska fylla i koden som efterfrågas och svara på frågorna.
% Notera att alla svar på frågor måste skrivas på raden som börjar med "%".
%--------------------------------------------------------------------------

clear all

%----- SKRIV KOD: Fyll i data-filens namn (ta med .csv, .txt, eller liknande) -----
filename="monthly_in_situ_co2_mlo.csv";
TABLE=readtable(filename);

%----- SKRIV KOD: Fyll i namnen på de kolumner som innehåller tid och data (dvs byt ut XXXXXX) -----
% Namnen på dessa kolumner finns oftast i csv filen. Men, om ni har
% läst in tabellen TABLE kan du se listan av kolumner genom att skriva 
% "T.Properties.VariableNames" i kommand-prompten. 
% Notera att när man arbetar med data någon annan skapat krävs ofta lite
% detektivarbete för att förstå exakt vad alla värden beskriver!
T = [ TABLE.Date_1 ];  % T ska vara en vektor med tiden för olika C02 mätningar
y = [ TABLE.CO2 ];  % y ska vara en vektor med data från CO2 mätningar 

%----- SKRIV KOD: Skapa en minstakvadrat anpassning av y(t) till en rät linje -----


%----- SKRIV KOD: Rita både mätdata och anpassningen i samma graf. -----


%----- SKRIV KOD: Skapa en minstakvadrat anpassning av y(t) till ett andragradspolynom -----


%----- SKRIV KOD: Rita både mätdata och anpassningen i samma graf. -----


%----- SKRIV KOD: Skapa en minstakvadrat anpassning av y(t) till ett tredjegradspolynom -----


%----- SKRIV KOD: Rita både mätdata och anpassningen i samma graf. -----


% Frågor:
% 1. Beskriv med egna ord hur de tre kurvorna beskriver. Framför allt, blir lösningen lite eller mycket bättre när vi går från en rät linje till en andragradsfunktion? Blir den mycket bättre när vi går från en andragradsfunktion till en tredjegradsfunktion?
% SVAR: ...

% 2. Kan man använda dessa anpassningar för att uppskatta utsläppen om 2 år? Motivera ditt svar.
% SVAR: ...

% 3. Kan man använda dessa anpassningar för att uppskatta utsläppen om 50 år? Motivera ditt svar.
% SVAR: ...


