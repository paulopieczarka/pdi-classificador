chdir('D:\git-clones\pdi-classificador\src');

clear;
exec('.\knn.sci');

scicv_Init();

xs = [1,2,3,4,5];
ys = [1,2,10,4,5];

[a, b] = euclideanDistances(xs, ys)
disp(a)
disp(b)
