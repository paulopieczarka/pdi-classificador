chdir 'C:\Users\moaci\Google Drive\Faculdade\4 ano\PDI\PDI_Trabalho_Imagens\pdi-classificador\';
clear;
exec('src\descriptors.sci');
exec('src\follow.sci');

scicv_Init();

for i=1:30
    obj = imread('img_db\lentilha_'+string(i)+'.png', CV_LOAD_IMAGE_GRAYSCALE);
    im = obj(:,:);
    delete_Mat(obj);

    [a,d] = descriptors(im);
    
    disp('Lentilha ' + string(i));
    disp('Area: ' + string(a));
    disp('Diametro: ' + string(d));
end


for i=1:30
    obj = imread('img_db\melancia_'+string(i)+'.png', CV_LOAD_IMAGE_GRAYSCALE);
    im = obj(:,:);
    delete_Mat(obj);

    [a,d] = descriptors(im);
    
    disp('Melancia ' + string(i));
    disp('Area: ' + string(a));
    disp('Diametro: ' + string(d));
end
