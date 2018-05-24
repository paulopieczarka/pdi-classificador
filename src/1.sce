clear;
exec('src\descriptors.sci');
exec('src\follow.sci');

scicv_Init();

function [lentilhas, melancias] = extractImageInfo()
    lentilhas = []
    melancias = []
    
    for i=1:30
        obj = imread('img_db\lentilha_'+string(i)+'.png', CV_LOAD_IMAGE_GRAYSCALE);
        im = obj(:,:);
        delete_Mat(obj);
    
        [a,d] = descriptors(im);
        
        lentilhas(i, 1) = a
        lentilhas(i, 2) = d
    end
    
    
    for i=1:30
        obj = imread('img_db\melancia_'+string(i)+'.png', CV_LOAD_IMAGE_GRAYSCALE);
        im = obj(:,:);
        delete_Mat(obj);
    
        [a,d] = descriptors(im);
        
        melancias(i, 1) = a
        melancias(i, 2) = d
    end
    
    disp(lentilhas(1, 1))
    disp(lentilhas(1, 2))
endfunction
