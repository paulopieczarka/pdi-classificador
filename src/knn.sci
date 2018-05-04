function neighbors = getNeighbors()
endfunction

// def euclideanDistance(instance1, instance2, length):
// 	distance = 0
// 	for x in range(length):
// 		distance += pow((instance1[x] - instance2[x]), 2)
// 	return math.sqrt(distance)

function [dists, mval] = euclideanDistances(xs, ys)
    dists = [];
    for j=1:length(xs)-1
        dx = xs(j) - xs(j+1);
        dy = ys(j) - ys(j+1);
        dists = [dists, sqrt( abs(dx) + abs(dy) )];
    end
    
    mval = max(dists);
endfunction
