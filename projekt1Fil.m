%--------------------------------------------------------------------------
% IX1303-VT2023: PROJEKTUPPGIFT 1, Linjära ekvationssystem
%
% Detta är en template.
% Ni ska fylla i koden som efterfrågas och svara på frågorna.
% Notera att alla svar på frågor måste skrivas på raden som börjar med "%".
%--------------------------------------------------------------------------

clear all

% List över antalet frihetsgrader (värden på n) som ska studeras.
% Här har vi alltså fyra olika fall som ska studeras, först n=1, sen n=30,
% sen n=300 och till sist n=3000.
nList = [3, 30, 300, 3000];

% Initiera tidsvektorerna. Här sätter vi alla värden till noll, men inne i
% looper ska ni sätta in den tid det tog att lösa ekvationssystemet.
T_mldivide = zeros(size(nList));
T_inv      = zeros(size(nList));

% Loop över de olika frihetsgraderna.
% Loopen innebär att koden mellan "for" och "end" kommer att köras 4 gånger
% (eftersom length(nList)=4), först med i=1, sen i=2, i=3 och i=4.
for i=1:length(nList)

  % Här skapar vi en variabel n. Värdet på n är 3 första gången vi går
  % igenom loopen, sen 30, 300 och 3000.
  % Värdet på n är antalet dimensioner hos ekvationssystemet vi ska lösa.
  n=nList(i);

  %----- SKRIV KOD: Skapa nxn matrisen A -----
  % Fråga: 
  %   Här är A=I-C, där C=kR och R är en matris med slumptal
  %   mellan 0 och 1. För vilka värden på k är kolumnsumman
  %   alltid (för alla möjliga slumptal) mindre än 1?
  % Svar: k < 1 / summan av av kolumnvärderna i R
  % ...
  I = eye(n)
  R = rand(n);
  k = 1/R(:, n);
  C = k*R;
  
  A = I - C;


  %----- SKRIV KOD:Skapa kolumn-vektorn b -----

  
  tic;
  %----- SKRIV KOD: Lös ekvationssystemet med mldivide -----
  T_mldivide(i)=toc;
  
  
  tic;
  %----- SKRIV KOD: Lös ekvationssystemet med inv -----
  T_inv(i)=toc;

  
  %----- SKRIV KOD: Jämför lösningarna från mldivide och inv -----

end


figure; hold on
%----- SKRIV KOD: Rita första figuren -----


figure; hold on
%----- SKRIV KOD: Rita andra figuren -----


% Frågor:
% 1. 1.	Antag att du ska lösa ett problem med tre obekanta en eller ett par gånger. Hur väljer du metod? Är det viktigt att välja rätt metod?
% SVAR: ...

% 2. Antag att du ska lösa ett problem med tre obekanta 10 000 gånger. Hur väljer du metod? Är det viktigt att välja rätt metod?
% SVAR: ...

% 3. Antag att du ska lösa ett problem med 3000 obekanta en eller ett par gånger. Hur väljer du metod? Är det viktigt att välja rätt metod?
% SVAR: ...

% 4. Kör om alla räkningar tre gånger. Varför får du olika resultat varje gång du kör programmet?
% SVAR: ...

% 5. Hur stor är den relativa skillnaden i beräkningstid mellan de två metoderna för 3000 obekanta?
% SVAR: ...
