# KNN
For Alphabet Classification for Letter Recognition Data Set from the UCI Machine Learning Repository

This dataset contains 20,000 examples. Divide the set so that the first 15,000 examples are for training and the remaining 5,000 for testing.

This project contains k-NN classification and the condensed 1-NN algorithm.

The format is 
[testY] = testknn(trainX, trainY, testX, k)

where trainX is a (nTrain *D) data matrix, testX is a (nTest * D) data matrix, trainY is a (nTrain * 1) label vector, and testY is a (nTest * 1) label vector, and k is the number of nearest neighbors for classification.

[condensedIdx] = condensedata(trainX, trainY)

where condensedIdx is a vector of indicies of the condensed training set.
