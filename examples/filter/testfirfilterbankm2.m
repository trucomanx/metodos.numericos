% 
IMAGESDIR='~/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');

%%
%% Low pass filter with cut-off frequency in 0.5*(Fs/2)
%%
ORDER=33;
H0=qmfmaker(ORDER);

%%
%% The information is transformed and separated by frequency bands.
%%
%%                     |---DATA11--- [0.75 to 1.00](Fs/2)
%%         |---DATA1---|
%%         |           |---DATA10--- [0.50 to 0.75](Fs/2)
%%  DATA---|
%%         |           |---DATA01--- [0.25 to 0.50](Fs/2)
%%         |---DATA0---|
%%                     |---DATA00--- [0.00 to 0.25](Fs/2)
%%
[DATA0  DATA1 ] = firfilterbank(DATA ,H0,'mode2');
[DATA10 DATA11] = firfilterbank(DATA1,H0,'mode2');  clear DATA1;
[DATA00 DATA01] = firfilterbank(DATA0,H0,'mode2');  clear DATA0;

%%
%% The information is untransformed and compound from frequency bands.
%%
%%  [0.75 to 1.00](Fs/2) ---DATA11---|
%%                                   |---DATA1_---|
%%  [0.50 to 0.75](Fs/2) ---DATA10---|            |
%%                                                |---DATA_
%%  [0.25 to 0.50](Fs/2) ---DATA01---|            |
%%                                   |---DATA0_---|
%%  [0.00 to 0.25](Fs/2) ---DATA00---| 
%%
DATA0_ =firsynthesisbank(DATA00,DATA01,H0); 
DATA1_ =firsynthesisbank(DATA10,DATA11,H0); 
DATA_  =firsynthesisbank(DATA0_,DATA1_,H0); 
clear DATA0_ DATA1_

%%
%% Comparing the matrices obtained after apply the PTD method in the signals
%% DATA and DATA_
%%
GPTD   =graphptd(DATA ,0.8);
GPTD_  =graphptd(DATA_,0.8);
clear DATA DATA_

%%
%% The information is untransformed from only one frequency band.
%%
%%   ---DATAij---|
%%               |---DATAi---|
%%                           |
%%                           |---DATAij_
%%
%% So that DATA10_+DATA10_+DATA01_+DATA00_ is approx to DATA
%%

DATA00_ = firsynthesispath(DATA00,H0,[0 0]);
DATA01_ = firsynthesispath(DATA01,H0,[0 1]);
DATA10_ = firsynthesispath(DATA10,H0,[1 0]);
DATA11_ = firsynthesispath(DATA11,H0,[1 1]);
clear DATA00 DATA01 DATA10 DATA11

%%
%% Matrices obtained after apply the graphic AVD method in the signals
%% DATA00_, DATA01_, ATA10_ and DATA11_
%%
GAVD11_   = graphavd(DATA11_);
GAVD10_   = graphavd(DATA10_);
GAVD01_   = graphavd(DATA01_);
GAVD00_   = graphavd(DATA00_);

%%
%% Showing the matrices generated from the signals DATA00_, DATA01_, ATA10_ 
%% and DATA11_ using the graphic AVD method.
%%
figure(3);
imagesc(GAVD11_,[0 27.062]);colorbar;
title('Graphic AVD method');

figure(4);
imagesc(GAVD10_,[0 27.062]);colorbar;
title('Graphic AVD method');

figure(5);
imagesc(GAVD01_,[0 27.062]);colorbar;
title('Graphic AVD method');

figure(6);
imagesc(GAVD00_,[0 27.062]);colorbar;
title('Graphic AVD method');
