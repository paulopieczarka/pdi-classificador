chdir('C:\Users\paulo\Documents\pdi-classificador');

clear;
exec('src\1.sce');
exec('src\knn.sci');

disp('Extraindo areas e distancias')
[lentilhas, melancias] = extractImageInfo()



traiLentilhas = lentilhas(1:20,:)
testLentilhas = lentilhas(21:30,:)

traiMelancias = melancias(1:20,:)
testMelancias = melancias(21:30,:)

disp('Definindo bases de test e treinamento')
trainingSet = cat(1, traiLentilhas, traiMelancias)
testSet = cat(1, testLentilhas, testMelancias)

disp('Classificando.')
[predictions, wrong] = knn(trainingSet, testSet, 3)

disp('done')
scatter(traiLentilhas(:,1), traiLentilhas(:,2), 'fill', 'o', 'markerBackground', [1,0,1], 'markerEdgeColor', [1,0,1]);
scatter(testLentilhas(:,1), testLentilhas(:,2), 'fill', 'o', 'markerBackground', [1,0,1], 'markerEdgeColor', [0,0,0]);
scatter(traiMelancias(:,1), traiMelancias(:,2), 'fill', 'o', 'markerBackground', [1,.38,.27], 'markerEdgeColor', [1,.38,.27]);
scatter(testMelancias(:,1), testMelancias(:,2), 'fill', 'o', 'markerBackground', [1,.38,.27], 'markerEdgeColor', [0,0,0]);
scatter(wrong(:,1), wrong(:,2), 'fill', 'x', 'markerEdgeColor', [1,1,1]);
