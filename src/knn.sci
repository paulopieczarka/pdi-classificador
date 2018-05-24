function neighbors = getNeighbors()
endfunction

// def euclideanDistance(instance1, instance2, length):
// 	distance = 0
// 	for x in range(length):
// 		distance += pow((instance1[x] - instance2[x]), 2)
// 	return math.sqrt(distance)

function [dists, mval] = euclideanDistances(sementes)
    dists = [];
    for j=1:length(sementes)-1
        dx = sementes(j, 1) - sementes(j+1, 1);
        dy = sementes(j, 2) - sementes(j+1, 2);
        dists = [dists, sqrt( abs(dx) + abs(dy) )];
    end
    
    mval = max(dists);
endfunction
