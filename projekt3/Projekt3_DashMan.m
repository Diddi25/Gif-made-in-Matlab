%--------------------------------------------------------------------------
% IX1303-VT2023: PROJEKTUPPGIFT 3, Streckgubben
%
% Detta är en template.
% Ni ska fylla i koden som efterfrågas och svara på frågorna.
% Notera att alla svar på frågor måste skrivas på raden som börjar med "%".
%--------------------------------------------------------------------------

clear all

filename = 'dashman.gif';
TimePerFrame = 0.05;
BoundingBox = [-1,1,-1,1]*6; % Om gubben hamnar utanför skärmen, så ändra här!
NumberOfTimeSteps = 50;

%------------------
% SKAPA MATRISERNA
%------------------
%----- SKRIV KOD: Skapa den matris som beskriver den efterfrågade avbildningen -----

%-- Rotation-- 
v = (-8*pi)/50; 
RM = [ cos(v) , -sin(v) , 0
       sin(v) , cos(v)  , 0 ]; %KANSKE ETTOR HÄR

%-- Förflyttning --
dx = -0.3;
dy = 0.3;
TM = [ 1, 0, dx
       0, 1, dy
       0, 0, 1  ];

%-- Förstoring --
f = 1 +(1.3/50);
FM = [ f, 0
       0, f ];

SM = RM * TM;
M = FM * SM;

%------------------------------
% SKAPA STRECKGUBBEN, DASH-MAN
%------------------------------

D=DashMan();

%-----------------------------------
% SKAPA FÖRSTA BILDEN I ANIMERINGEN
%-----------------------------------
figure(1);
clf; hold on;
axis equal
axis(BoundingBox)
set(gca,'visible','off')


plotDashMan(D); % Här ritar vi Dash-man som han ser ut från början
addFrameToGif(filename, 1, TimePerFrame)

%-----------------------------------------------------
% Loopa över alla bilder i animeringen, från 2 till 50
%-----------------------------------------------------
for i = 2:50

  %----- SKRIV KOD: Transformera alla DASH-MAN's kroppsdelar -----
  % Här ska du uppdatera punkter i D, dvs alla punkter i huvudet, kroppen osv.
  
  u_arms = M * D.arms;
  D.arms = [ u_arms; 1 1 1 ];   %u_arms;   

  u_body = M * D.body;
  D.body = [ u_body; 1 1 ]; %u_body; 

  u_head = M * D.head;
  D.head = [ u_head; ones(size(linspace(-pi,pi,50))) ]; %u_head; 

  u_legs = M * D.legs;
  D.legs = [u_legs; 1 1 1 ];    %u_legs;    

  u_mouth = M * D.mouth;
  D.mouth = [ u_mouth; ones(size(linspace(-pi,pi,50))) ];   %u_mouth   %

  hold off

  plotDashMan(D); % Här ritar vi Dash-man som han ser ut efter transformationen
  axis equal
  axis(BoundingBox)
  set(gca,'visible','off')
  addFrameToGif(filename, i, TimePerFrame)
  
end


% Frågor:
%	1. Varför innehåller sista raden i D.head bara ettor?
% SVAR: Ettorna är homogena koordinater, de används för att kunna
% translatera punkter i ett plan som inte går genom origo. 

% 2. Beskriv skillnaden i gubbens rörelse över flera varv (d.v.s banan 
% gubben rör sig längs) när man translaterar uppåt, neråt, åt höger eller 
% vänster?
% SVAR: Skillnaden på att translatera uppåt, neråt, åt höger eller åt
% vänster beror på de värden vi tilldelar dx och dy i translationsmatrisen
% TM. "Uppåt" innebär positiva värden på dy och "neråt" innebär negativa
% värden på dy, det vill säga positiv eller negativ förflyttning i y-led.
% På samma sätt innebär "åt höger" positiva värden för dx och "åt vänster"
% negativa värden på dx, vilket innebär positiv eller negativ förflyttning
% i x-led.

% 3. Om man flyttar gubben en sträcka dx=0.1 per steg, och vi tar 50 steg 
% med kombinerad translation och rotation, varför har gubben inte flyttats 
% 50*0.1 åt höger?
% SVAR: Eftersom att förflyttningen är en kombination av translation och
% rotation, och vi förändrar DashMan i 50 iterationer. Det innebär att efter
% varje iteration har vi ett nytt utgångsläge att applicera 
% rotationsmatrisen på. Vi kan se translationsmatrisen som en
% förflyttningsvektor för DashMan, dvs avstånd, och rotationsmatrisen dess 
% riktning i xy-planet, dvs förändring i vinkel sedan förra iterationen. 
