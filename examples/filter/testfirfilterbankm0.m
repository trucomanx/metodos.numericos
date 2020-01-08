% 
IMAGESDIR='~/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');

%%             
%%      |--- [0.500 to 1.000](Fs/2) REAMAINDER
%%  ---H0
%%      |--- [0.000 to 0.500](Fs/2) PASS
%%
%%
%%      |--- [0.250 to 1.000](Fs/2) REAMAINDER
%%  ---G0
%%      |--- [0.000 to 0.250](Fs/2) PASS
%%
%%
%%      |--- [0.125 to 1.000](Fs/2) REAMAINDER
%%  ---W0
%%      |--- [0.000 to 0.125](Fs/2) PASS
%%
ORDER=32;
H0 = get_fir_filter(ORDER,0.500,'low');
G0 = get_fir_filter(ORDER,0.250,'low');
W0 = get_fir_filter(ORDER,0.125,'low');

%%             
%%         |------------------------------DATA1--- [0.500 to 1.000](Fs/2)
%%  DATA---+
%%         |           |-----------------DATA01--- [0.250 to 0.500](Fs/2)
%%         |---DATA0---+
%%                     |            |---DATA001--- [0.125 to 0.250](Fs/2)
%%                     |---DATA00---+
%%                                  |---DATA000--- [0.000 to 0.125](Fs/2)
%%
[DATA0   DATA1  ] = firfilterbank(DATA,H0,'mode0');
[DATA00  DATA01 ] = firfilterbank(DATA0,G0,'mode0');    clear DATA0
[DATA000 DATA001] = firfilterbank(DATA00,W0,'mode0');   clear DATA00


%%
%% Matrices with the graphic AVD of the signal DATA and your
%% equivalent reconstructed signal DATA1+DATA01+DATA001+DATA000
%%
GAVD   =graphavd(DATA,'off');
GAVD_  =graphavd(DATA1+DATA01+DATA001+DATA000,'off');

%%
%% Matrices with the graphic AVD in each frequency band of signal DATA
%%
GAVD1  =graphavd(DATA1,'off');
GAVD01 =graphavd(DATA01,'off');
GAVD001=graphavd(DATA001,'off');
GAVD000=graphavd(DATA000,'off');

%%
%% Showing the graphic AVD method over the datapacks DATA and 
%% DATA1+DATA01+DATA001+DATA000. 
%%
figure(1);
imagesc(GAVD,[0 36]);colorbar;
title('Graphic AVD method');

figure(2);
imagesc(GAVD_,[0 36]);colorbar;
title('Graphic AVD method');

%%
%% Showing the graphic AVD method over the datapacks DATA1, DATA01, DATA001 
%% and DATA000. 
%%
figure(3);
imagesc(GAVD1,[0 36]);colorbar;
title('Graphic AVD method');

figure(4);
imagesc(GAVD01,[0 36]);colorbar;
title('Graphic AVD method');

figure(5);
imagesc(GAVD001,[0 36]);colorbar;
title('Graphic AVD method');

figure(6);
imagesc(GAVD000,[0 36]);colorbar;
title('Graphic AVD method');
