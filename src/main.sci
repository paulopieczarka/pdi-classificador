chdir('C:\Users\paulo\Documents\pdi-classificador');

clear;
exec('src\1.sce');
exec('src\knn.sci');

disp('Extraindo areas e distancias')
[lentilhas, melancias] = extractImageInfo()

disp('Definindo bases de test e treinamento')
scatter(lentilhas(:,1), lentilhas(:,2), 'fill', '.');
//scatter(melancias(:,1), melancias(:,2));
