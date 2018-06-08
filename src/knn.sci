function distance = euclidianDistance(instance1, instance2, len)
  distance = 0
  for x = 1:len
    distance = distance + (instance1(x) - instance2(x))^2
  end
  distance = sqrt(distance)
endfunction

function sortedTable = msort(table, sortBy, direction)
  len = size(table, 1)
  sortedTable = []
  [a, h] = gsort(table(:, sortBy), 'r', direction) // sorted distances
  for x = 1:len
    sortedTable = cat(1, sortedTable, table(h(x), :))
  end
endfunction

function neighbors = getNeighbors(trainingSet, testInstance, k)
  distances = []
  len = length(testInstance)-1 // type less instance
  for x = 1:size(trainingSet, 1)
    dist = euclidianDistance(testInstance, trainingSet(x,:), len)
    distances = cat(1, distances, [trainingSet(x,:), dist])
  end
  
  distances = msort(distances, $, 'i')
  
  neighbors = []
  for x = 1:k
    neighbors = cat(1, neighbors, distances(x,1:3))
  end
endfunction

function response = classify(neighbors)
  len = size(neighbors, 1)
  votes = zeros(1, len)
  for x = 1:len
    guess = neighbors(x, $)
    votes(guess) = votes(guess) + 1
  end
  
  [amount, index] = max(votes)
  response = index
endfunction

function accuracy = getAccuracy(testSet, predictions)
  correct = 0
  len = size(testSet, 1)
  for x = 1:len
    if testSet(x, $) == predictions(x) then
      correct = correct + 1;
    end
  end
  
  accuracy = (correct/len) * 100
endfunction

function [predictions, wrong] = knn(trainingSet, testSet, k)
  predictions = []
  wrong = []
  for x = 1:size(testSet, 1)
    neighbors = getNeighbors(trainingSet, testSet(x,:), k)
    result = classify(neighbors)
    predictions = cat(1, predictions, result)
    disp('> predicted='+string(result)+', actual='+string(testSet(x,$)))
    if testSet(x, $) <> predictions(x) then
      wrong = cat(1, wrong, testSet(x, 1:2))
    end
  end
  
  accuracy = getAccuracy(testSet, predictions)
  disp('Accuracy='+string(accuracy)+'%')
endfunction
