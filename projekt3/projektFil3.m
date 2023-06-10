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
BoundingBox = [-1,1,-1,1]*14; % Om gubben hamnar utanför skärmen, så ändra här!
NumberOfTimeSteps = 50;

%------------------
% SKAPA MATRISERNA
%------------------


%----- SKRIV KOD: Skapa den matris som beskriver den efterfrågade avbildningen -----

  
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


  hold off
  plotDashMan(D); % Här ritar vi Dash-man som han ser ut efter transformationen
  axis equal
  %axis(BoundingBox)
  %set(gca,'visible','off')
  addFrameToGif(filename, i, TimePerFrame)
end


% Frågor:
%	1. Varför innehåller sista raden i D.head bara ettor?
% SVAR: Huvudet börjar från när x = 0 och y = 1. 

% 2. 2.	Beskriv skillnaden i gubbens rörelse över flera varv (d.v.s banan gubben rör sig längs) när man translaterar uppåt, neråt, åt höger eller vänster?
% SVAR: ...

% 3. Om man flyttar gubben en sträcka dx=0.1 per steg, och vi tar 50 steg med kombinerad translation och rotation, varför har gubben inte flyttats 50*0.1 åt höger?
% SVAR: ...
