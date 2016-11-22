function varagout = orbit(planet)
% Author: James Parkus
% Date: August 2nd, 2016
% Purpose: Calculate the velocity required for orbit around Mars at varying
% altitudes

%% Constants
G = 6.67*10^(-11); %kgm^2/s^2
    
%% Astronomical Data Excel File
data = xlsread('Astronomical_Data.xlsx');
Mass = data(:,3)
Radius = data(:,4)

if planet == 1
    PlanetName = 'Mercury';
else
    if planet == 2
        PlanetName = 'Venus';
    else
        if planet == 3
            PlanetName = 'Earth';
        else
            if planet == 4
                PlanetName = 'Mars';
            else
                if planet == 5
                    PlanetName = 'Jupiter';
                else
                    if planet == 6
                        PlanetName = 'Saturn';
                    else
                        if planet == 7
                            PlanetName = 'Uranus';
                        else
                            if planet == 8
                                PlanetName = 'Neptune';
                            else
                                if planet == 9
                                    PlanetName = 'Pluto';
                                else
                                    display('Invalid planet number')
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
%% Planet Conditions
M = data(planet,3);
R = data(planet,4);

%% Calculations
Orbit = (1);
OrbitalPeriod = (1);
rowinc = 1;

for height = 5000:10:100000
   Velocity = sqrt((G*M)/(R+height));
   Orbit(rowinc,1) = Velocity;
   Orbit(rowinc,2) = height;
   rowinc = rowinc + 1;
end

rowinc = 1;
datainc = 1;

for rad = 1:1:9501
    r2 = Orbit(datainc,2);
    T = [(4*pi()^2)/(G*M)]*(R+r2)^3;
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