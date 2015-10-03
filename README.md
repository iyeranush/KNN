# KNN
For Alphabet Classification for Letter Recognition Data Set from the UCI Machine Learning Repository

This dataset contains 20,000 examples. Divide the set so that the first 15,000 examples are for training and the remaining 5,000 for testing.

This project contains k-NN classification and the condensed 1-NN algorithm.

The format is 
[testY] = testknn(trainX, trainY, testX, k)

where trainX is a (nTrain *D) data matrix, testX is a (nTest * D) data matrix, trainY is a (nTrain * 1) label vector, and testY is a (nTest * 1) label vector, and k is the number of nearest neighbors for classification.

[condensedIdx] = condensedata(trainX, trainY)

where condensedIdx is a vector of indicies of the condensed training set.


****Algorithm Procedure folowed

1. Data is imported total 20000 rows
2. Data is divided into train and test 15000:5000
3. For KNN:
   Sample the training data.
   Call function for KNN.
   Calculate accuracy, time.
4. For CNN:
   Sample the training data.
   Condense training data.Call function for CNN.
   Change training according to the condensed result.
   Call KNN
   Calculate accuracy, time.


****K-NN****
K-NN is nearest neighbourhood algorithm with various options for K.

Algorithm K-NN

1. Take the training dataset.
2. For each row in the test dataset compare(find distance) with all the
   data elements in the train data set.
3. Here euclidean distance is used.
4. Once all the distance is calculated find the top K distance using sorting.
   This means you are finding k nearest neighbours.
5. Calculate the neighbour that happens max times.
6. Thats your classification for the current test data.  


****Condensed KNN(CNN)****

This algorithm has 3 parts:
1. Outlier removal: 
   Simply removes the outlier data from the train data.
    
2. Creating the prototype:
   Works on the data formed after removing the outlier. For every element in that dataset,
   removes it and puts it one by one on the prototype data set as per the algorithm. 
   
3. Updating the training set according to the Prototype:
   The prototype dataset is now used as the training set. 

Algorithm CNN:

1. Take trainX, trainY.
2. Remove outliers from the data:
   For each data row  in the training set do
   -check it will all the other data from within the training set.
   -If it is correctly classified, retain the particular row.
   -else discard it saying that it was an outlier.
3. Now work on the data obtained after removing the outlier. 
   This is your training data for now.
4. Randomly pick one row from this training data.
5. Put it in Prototype dataset. New dataset.(This is going to be the condensed dataset)
6. For each data selected randomly:
   -Check it with all the elemeents in Prototype dataset.
   -IF the elements in the prototype classify the new data correctly
   -Then move on.
   -Else add this particular data in the prototype assuming that the 
    previous data in prototype was not enough.
7. Once all the elements in the train set is completed, you will be left with 
   condensed data in Prototype dataset. 

%%%%%%%%%%% Confusion matrix
%%%%%%%%%%% Experiments

1. Number of experiments:
   2 (algorithms) * 5 (values of k) * 6(values of N) = 60 total experiments
2. Accuracy:
   -For KNN:
   --With every increase in K the accuracy was observed to decrease. 
   --With every increase in subsample, the accuracy increases.
   -For CNN
   --With every increase in K the accuracy was observed to decrease. 
   --With every increase in subsample, the accuracy increases.
3. Running time:
   -For KNN:
   --With every increase in K the time was observed to increases. 
   --With every increase in subsample, the time increases.
   -For CNN 
   --Overall time decreased for the KNN after the dataset is once condensed.
   --With every increase in subsample, the time increases.
   --Otherwise for diffrent K and same subsample the time varies as it is a random process. 
     But it does not differ too much. 


%%%%%%%%%%% Problems Faced

1. Since this was a high dimentional space, time taken is observed to be more. 
   If the dataset increases, the time will be more.
2. One more problem was to keep track and use the training data several times 
   to find the distance.




