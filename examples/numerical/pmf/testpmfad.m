% 

% Download biospeckle data of:
% http://repositorio.ufla.br/jspui/handle/1/10619
IMAGESDIR='/home/fernando/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');

THSP=thsp(DATA,1,240);
COM=coom(THSP);
[Pr Z]=pmfad(COM);


figure(1)
plot(Z,Pr,'--o'),grid
hx=xlabel('|i-j|=z');
hy=ylabel('Probability');
ht=title('Probability Mass Function');
xlim([0 50]);

