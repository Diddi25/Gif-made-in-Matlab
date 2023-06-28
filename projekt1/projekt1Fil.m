%--------------------------------------------------------------------------
% IX1303-VT2023: PROJEKTUPPGIFT 1, Linjära ekvationssystem
%
% Detta är en template.
% Ni ska fylla i koden som efterfrågas och svara på frågorna.
% Notera att alla svar på frågor måste skrivas på raden som börjar med "%".
%--------------------------------------------------------------------------

clear all

% List över antalet frihetsgrader (värden på n) som ska studeras.
% Här har vi alltså fyra olika fall som ska studeras, först n=3, sen n=30,
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
  % t.ex k = 0.5
  % ...
  I = eye(n);
  R = rand(n);
  k = 1/n;
  C = k*R;
  A = I - C;


  %----- SKRIV KOD:Skapa kolumn-vektorn b -----
  B = rand(n, 1);
  
  tic;
  %----- SKRIV KOD: Lös ekvationssystemet med mldivide -----
  x1 = mldivide(A,B);
  T_mldivide(i)=toc;
  
  
  tic;
  %----- SKRIV KOD: Lös ekvationssystemet med inv -----
  % För att det ska finnas lösningar till matrisekvationen Ax = B
  % behöver A och B vara av samma dimensioner, vara kvadratiska, 
  % samt att A är inverterbar

  % För att se om A är inverterbar:
  if det(A) ~= 0
      A_inverse = inv(A);
      x2 = A_inverse * B;
  else
      disp("Matris är singulär och har därför ingen invers");
  end

  T_inv(i)=toc;

  %disp("Result of first method is:", x1);
  %disp("Result of second method is:", x2);
  %----- SKRIV KOD: Jämför lösningarna från mldivide och inv -----

end


figure; hold on
%----- SKRIV KOD: Rita första figuren -----
plot(T_mldivide)
title('Linear Scale Plot For mldivide');


figure; hold on
%----- SKRIV KOD: Rita andra figuren -----
plot(T_inv)
title('Linear Scale Plot For inv');


figure; hold on
%----- SKRIV KOD: Rita första figuren med logaritmisk skala -----
plot(T_mldivide)
title('Logarithmic Scale Plot For mldivide');
set(gca, 'xscale', 'log');
set(gca, 'yscale', 'log');


figure; hold on
%----- SKRIV KOD: Rita första figuren med logaritmisk skala -----
plot(T_inv)
title('Logarithmic Scale Plot For inv');
set(gca, 'xscale', 'log');
set(gca, 'yscale', 'log');


% Frågor:
% 1. 1.	Antag att du ska lösa ett problem med tre obekanta en eller ett par gånger. Hur väljer du metod? Är det viktigt att välja rätt metod?
% SVAR: En olämplig metod kan leda till numeriska problem, långsam beräkningstid eller felaktiga resultat. 
% Genom att överväga faktorer som storleken på matrisen, matrisens egenskaper och tillgång till beräkningsresurser 
% kan man välja den mest lämpliga metoden, t.ex gauss eliminering, inversion eller iterativa metoder
% som ger noggranna och effektiva lösningar för specifika problem.

% Edit: Det är inte jätteviktigt att använda rätt metod när det är ett
% litet antal obekanta, men för att lösa ekvationen så behöver t.ex.
% inversion kräva ett steg innan man löser ekvationen, dvs testa om matrisen är
% singulär (determinanten är 0) vilket gör att matrisen inte har en invers 
% för att lösa det. Detta gör att mldivide är effektivare eftersom den
% använder en kombination av tekniker som exempelvis LU-faktorisering eller
% singular value decomposition, (SVD) beroende på matrisen A´s egenskaper i
% Ax=B. Detta stödjs av kurvan i de logaritmiska graferna där mldivide är lite
% snabbare än inv. Detta gör också att mldivide är stabilare och mindre
% beräkningsintensivt jämfört med inv. 

% 2. Antag att du ska lösa ett problem med tre obekanta 10 000 gånger. Hur väljer du metod? Är det viktigt att välja rätt metod?
% SVAR: För att välja en noggrann och effektiv metod kan komplexiteten hos metoderna och
% egenskaperna av matrisekvationer behöva analyseras. Vissa metoder kan ha högre tidskomplexitet 
% och vara mindre lämpliga för stora matriser eller stort antal
% iterationer, även om nogrannheten kan kompromissas mot lägre komplexitets metoder.
% För stora matriser kan iterativa metoder vara mer effektiv,
% t.ex. Newton Paphsons metod, än direkt lösning, t.ex. inversion eller
% eliminering. Om matrisen har speciella egenskaper så kan
% bandlösningsalgoritmer utnyttjas. (t.ex. för 2X2 matriser) Dessa
% optimeringar kan effektivisera exekveringstiden och kräva mindre
% beräkningskraft. 

% Edit: Utifrån vad man ser i graferna är skillnaden på beräkningstiden för 
% 3 obekanta inte särskilt stor. Men med samma resonemang som ovan anses
% mldivide vara en stabilare metod för att lösa matrisekvationer. 

% 3. Antag att du ska lösa ett problem med 3000 obekanta en eller ett par gånger. Hur väljer du metod? Är det viktigt att välja rätt metod?
% SVAR: Det är viktigt att välja rätt metod för samtliga frågor och
% beroende på ekvationens egenskaper kan den ena metoden vara bättre än den
% andra med hänsyn till nogrannhet och effektivitet. För större och mer 
% komplexa matriser kan iterativa metoder som konjugerad gradient eller 
% GMRES vara effektivare och kräva mindre beräkningsresurser jämfört med
% direkta lösningar. 

% Edit: Det är väldigt viktigt att använda rätt metod en matris med 3000
% obekanta för att effektivitet, noggrannhet och beräkningsintensivitet ska
% bli så kostnadseffektivt som möjligt. I graferna ser man en stor skillnad på
% beräkningstiden mellan inv och mldivide där mldivide är effektivare ju
% fler obekanta matrisen har. Detta med samma anledning som resonemangen
% ovan. 

% 4. Kör om alla räkningar tre gånger. Varför får du olika resultat varje gång du kör programmet?
% SVAR: I beräkningarna används slumptal för att generera matrisen R, C och
% A.

% 5. Hur stor är den relativa skillnaden i beräkningstid mellan de två metoderna för 3000 obekanta?
% SVAR: Den direkta lösningen med hjälp av operatorn mldivide har en tidskomplexitet som är linjär (O(n^k), 
% där k är nära 1) för strukturerade matriser, medan lösningen med inversen av matrisen har en tidskomplexitet 
% som är närmare kvadratisk (O(n^2)).
