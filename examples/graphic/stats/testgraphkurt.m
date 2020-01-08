% 

% Download biospeckle data of:
% http://repositorio.ufla.br/jspui/handle/1/10619
IMAGESDIR='/home/fernando/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');
LIN=240;	LIN_WIDE=64;
COL=320;	COL_WIDE=64;

PORTIONDATA=DATA(LIN+[0:LIN_WIDE-1],COL+[0:COL_WIDE-1],:);

[K D E]=graphkurt(PORTIONDATA);

