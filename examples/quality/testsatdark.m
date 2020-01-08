% 

% Download biospeckle data of:
% http://repositorio.ufla.br/jspui/handle/1/10619
IMAGESDIR='/home/fernando/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');

IMAGE1=DATA(:,:,1);

[Img S D]=satdark(IMAGE1,8,8,20,150,50);

