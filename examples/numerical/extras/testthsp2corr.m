% 

% Download biospeckle data of:
% http://repositorio.ufla.br/jspui/handle/1/10619
IMAGESDIR='/home/fernando/data/cafe-biospeckle/sem1';

DATA=datapack(IMAGESDIR,'',1,128,'bmp');

THSP=thsp(DATA,1,240);

[C1 L1]   = thsp2corr(THSP,1);
[C2 L2]   = thsp2corr(THSP,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
[ax,p1,p2]=plotyy(L1,C1,L2,C2);
hx=xlabel('L1 and L2');
hy1=ylabel(ax(1),'C1');
hy2=ylabel(ax(2),'C2');
set(p1,'Marker','s');
set(p2,'Marker','o');
legend ([p1, p2], {'Pearson corr.','Xu et al. corr.'},'Location','northoutside','Orientation','horizontal');

