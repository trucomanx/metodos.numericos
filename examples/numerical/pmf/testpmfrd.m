% 

% Download biospeckle data of:
% http://repositorio.ufla.br/jspui/handle/1/10619
IMAGESDIR='/home/fernando/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');

THSP=thsp(DATA,1,240);
COM=coom(THSP);
[Pr W]=pmfrd(COM);


figure(1);
plot(W,Pr,'--o'), grid on
hx=xlabel('(i-j)=w');
hy=ylabel('Probability');
ht=title('Probability mass function');
xlim ([-50 50]);

