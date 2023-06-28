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
                    sin(v), cos(v),  0
                    0,      0,       1]; %rotationsmatris i 2D moturs

dx = -0.5;
dy = 0.5;
translations_matris = [1, 0, dx
                       0, 1, dy
                       0, 0, 1]; %dx och dy = förskjutningsvärden i respektive led


[sx, sy] = deal(1 +(1.5/50)); %samma skalningsfaktor för x- och y led
skalningsmatris = [sx, 0, 0
                   0, sy, 0
                   0,  0, 1]; 

%----- SKRIV KOD: Skapa den matris som beskriver den efterfrågade avbildningen -----

CM = skalningsmatris * translations_matris * rotations_matris; %resulterande transformations matris

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
  
  D.head = CM * D.head;

  D.mouth = CM * D.mouth;

  D.body = CM * D.body;

  D.legs = CM * D.legs;

  D.arms = CM * D.arms;


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
% såsom rotation, translation samt skalning, genom matrismultiplikation. 

% Edit: Inom datorgrafik och geometri används ett homogent koordinatsystem
% för att representera punkter och transformationer på ett enhetligt sätt.
% I jämförelse med ett vanligt kartesiskt koordinatsystem läggs det till en
% extra koordinat, en homogen koordinat. Men i vårt fall är den koordinaten
% 1, vilket syftar till att motsvara direkta punkten (x, y) i ett
% kartesiskt koordinatsystem eftersom gubben är i ett 2D system. Att 
% använda en homogen koordinat som har värdet 1 möjliggör att ingen extra
% koodrinat behövs för att modifiera/skala punktens position. Detta gör
% även att koordinaterna inte behöver normaliseras i transformationerna.

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
