% 

%%
%% 3 Morlet wavelets with mother wavelet in PSI0
%%
SIDEPOINTS=16; % Side points in the mother wavelet
t=linspace(-3.5,3.5,2*SIDEPOINTS+1);    
PSI0 = exp(-0.5*t.^2).*cos(5*t);	
t=linspace(-3.5,3.5,4*SIDEPOINTS+1);    
PSI1 = exp(-0.5*t.^2).*cos(5*t);			
t=linspace(-3.5,3.5,8*SIDEPOINTS+1);    
PSI2 = exp(-0.5*t.^2).*cos(5*t);		

%%
%% Normalizing the wavelets to have a unitary energy.
%%
PSI0=PSI0/sum(PSI0.^2);
PSI1=PSI1/sum(PSI1.^2);
PSI2=PSI2/sum(PSI2.^2);

%%
%% Showing the frequency behavior of wavelets PSI0, PSI1 and PS2
%%
POINTS_BY_CURVE = 256;
[FR0 F0]=freqmod(PSI0,POINTS_BY_CURVE);
[FR1 F1]=freqmod(PSI1,POINTS_BY_CURVE);
[FR2 F2]=freqmod(PSI2,POINTS_BY_CURVE);

figure(1);
plot(F0,FR0,'-o',F1,FR1,'-s',F2,FR2,'->');
legend( 'Freq. response of PSI0', ...
		'Freq. response of PSI1', ...
		'Freq. response of PSI2');
ylabel('|Magnitude|');
xlabel('W/\pi normalized frequency');


%%
%% 128 BMP files are loaded in a 3D matrix called DATA.
%%
IMAGESDIR='~/data/cafe-biospeckle/sem1';
DATA=datapack(IMAGESDIR,'',1,128,'bmp');

%%
%% Getting the signals DATA0, DATA1 and DATA2; using the wavelets 
%% PSI0, PSI1 and PSI2.
%%
%%         |---[PSI0]--- DATA0
%%         |
%% DATA ---|---[PSI1]--- DATA1
%%         |
%%         |---[PSI2]--- DATA2
%%
%% With the signals obtained are calculated the matrices GAVD0, GAVD1 and 
%% GAVD2 (Here, it is used the graphic AVD method).
%%
DATA0 = datapack_conv(DATA,PSI0);
GAVD0 = graphavd(DATA0);
clear DATA0

DATA1 = datapack_conv(DATA,PSI1);
GAVD1 = graphavd(DATA1);
clear DATA1

DATA2 = datapack_conv(DATA,PSI2);
GAVD2 = graphavd(DATA2);
clear DATA2

%%
%% Showing the matrices GAVD0, GAVD1 and GAVD2
%%
figure(2);
imagesc(GAVD0,[0 18.226]);colorbar;
title('Graphic AVD method');

figure(3);
imagesc(GAVD1,[0 18.226]);colorbar;
title('Graphic AVD method');

figure(4);
imagesc(GAVD2,[0 18.226]);colorbar;
title('Graphic AVD method');
