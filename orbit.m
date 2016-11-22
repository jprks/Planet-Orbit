function varagout = orbit(planet)
% Author: James Parkus
% Date: August 2nd, 2016
% Purpose: Calculate the velocity required for orbit around Mars at varying
% altitudes
% Planet #
% 1 - Mercury
% 2 - Venus
% 3 - Earth
% 4 - Mars
% 5 - Jupiter
% 6 - Saturn
% 7 - Uranus
% 8 - Neptune
% 9 - Pluto

%% Constants
Gravitational_Constant = 6.67*10^(-11); %kgm^2/s^2
    
%% Astronomical Data Excel File
data = xlsread('Astronomical_Data.xlsx');
MassData = data(:,3);
RadiusData = data(:,4);

switch planet
    case 1
        PlanetName = 'Mercury';
    case 2
        PlanetName = 'Venus';
    case 3
        PlanetName = 'Earth';
    case 4 
        PlanetName = 'Mars';
    case 5
        PlanetName = 'Jupiter';
    case 6
        PlanetName = 'Saturn';
    case 7
        PlanetName = 'Uranus';
    case 8
        PlanetName = 'Neptune';
    case 9
        PlanetName = 'Pluto';
end
%% Planet Conditions
Planet_Mass = MassData(planet,1);
Planet_Radius = RadiusData(planet,1);

%% Calculations
Orbit = (1);
OrbitalPeriod = (1);
rowinc = 1;

for height = 5000:10:100000 % adjust to your liking, remember the mathematically the velocity and period cannot go to 0
   Velocity = sqrt((Gravitational_Constant*Planet_Mass)/(Planet_Radius+height));
   Orbit(rowinc,1) = Velocity;
   Orbit(rowinc,2) = height;
   rowinc = rowinc + 1;
end

rowinc = 1;
datainc = 1;

for rad = 1:1:9501
    r2 = Orbit(datainc,2);
    T = [(4*pi()^2)/(Gravitational_Constant*Planet_Mass)]*(Planet_Radius+r2)^3;
    OrbitalPeriod(rowinc,1) = T;
    OrbitalPeriod(rowinc,2) = r2;
    rowinc = rowinc + 1;
    datainc = datainc + 1;
end

%% Plots
figure()
plot(Orbit(:,2),Orbit(:,1))
ylabel('Height [m]')
xlabel('Orbital Velocity [m/s]')
title(PlanetName)

figure()
plot(OrbitalPeriod(:,2),OrbitalPeriod(:,1))
ylabel('Height [m]')
xlabel('Orbital Period [s]')
title(PlanetName)

end