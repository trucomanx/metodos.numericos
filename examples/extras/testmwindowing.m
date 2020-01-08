%
IMAGESDIR='~/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');

GAVD=graphavd(DATA,'off');

WLines=7;
WColumns=7;
GAVDW = mwindowing(GAVD,WLines,WColumns);

