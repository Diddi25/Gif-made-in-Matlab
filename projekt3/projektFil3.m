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
BoundingBox = [-1,1,-1,1]*13; % Om gubben hamnar utanför skärmen, så ändra här!
NumberOfTimeSteps = 50;

%------------------
% SKAPA MATRISERNA
%------------------

v = pi/8; %rotationsvinkel i rad
rotations_matris = [cos(v), -sin(v), 0
                    sin(v), cos(v),  0]; %rotationsmatris i 2D moturs

dx = -0.5;
dy = 0.5;
translations_matris = [1, 0, dx
                       0, 1, dy
                       0, 0, 1]; %dx och dy = förskjutningsvärden i respektive led


[sx, sy] = deal(1 +(1.5/50)); %samma skalningsfaktor för x- och y led
skalningsmatris = [sx, 0
                   0, sy]; 

%----- SKRIV KOD: Skapa den matris som beskriver den efterfrågade avbildningen -----

M = skalningsmatris * rotations_matris * translations_matris; %resulterande transformations matris

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
%axis(BoundingBox)
%set(gca,'visible','off')

plotDashMan(D); % Här ritar vi Dash-man som han ser ut från början
addFrameToGif(filename, 1, TimePerFrame)

%-----------------------------------------------------
% Loopa över alla bilder i animeringen, från 2 till 50
%-----------------------------------------------------
for i = 2:50


  %----- SKRIV KOD: Transformera alla DASH-MAN's kroppsdelar -----
  % Här ska du uppdatera punkter i D, dvs alla punkter i huvudet, kroppen osv.
  
  new_head = M * D.head;
  D.head = [new_head; ones(size(linspace(-pi,pi,50)))];

  new_mouth = M * D.mouth;
  D.mouth = [new_mouth; ones(size(linspace(-pi,pi,50)))];

  new_arms = M * D.arms;
  D.arms = [new_arms; 1, 1, 1];

  new_body = M * D.body;
  D.body = [new_body; 1, 1];

  new_legs = M * D.legs;
  D.legs = [new_legs; 1, 1, 1];



  hold off
  plotDashMan(D); % Här ritar vi Dash-man som han ser ut efter transformationen
  axis equal
  axis(BoundingBox)
  set(gca,'visible','off')
  addFrameToGif(filename, i, TimePerFrame)
end


% Frågor:
%	1. Varför innehåller sista raden i D.head bara ettor?

% SVAR: Det är homogena koordinater för att sammanfoga transformationerna,  
% såsom rotation, translation samt skalning, genom matrismultiplikation. Detta
% används för att möjliggöra perspektiveffekterna när gubben rör på sig.

%   2. Beskriv skillnaden i gubbens rörelse över flera varv (d.v.s banan 
% gubben rör sig längs) när man translaterar uppåt, neråt, åt höger eller 
% vänster?

% SVAR: Genom multiplikation med rotationsmatrisen roteras alla punkter
% runt den givna rotationspunkten som beskrivs i matrisen. Translationen
% för punkterna möjliggörs med hjälp av förskjutningsvärdena dy och dx i
% respektive led. Negativa värden för dy translaterar punkterna nedåt och
% för positiva värden uppåt. Detsamma gäller dx med skillnaden att de negativa 
% värden translaterar åt höger och tvärtom mot vänster. Med
% skalningsfaktorn i skalningsmatrisen "spänns" alla punkter upp och gör
% att gubben verkar förstoras efter varje iteration. 

% 3. Om man flyttar gubben en sträcka dx=0.1 per steg, och vi tar 50 steg 
% med kombinerad translation och rotation, varför har gubben inte flyttats 
% 50*0.1 åt höger?

% SVAR: Eftersom hela transformationen efter varje iteration sker med en 
% kombination av rotation, translation samt förstoring. Detta gör att
% transformationerna inte endast utgörs av translation, dvs att punkterna
% inte bara förlfyttas i x och y led. Utan att varje punkt har en ny
% utgångspunkt som resultat av rotationen. 
