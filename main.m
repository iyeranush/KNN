

%Import data from the file provided by Letter Recognition 
%Data Set from the UCI Machine Learning using importdata function
%Repository
MLdata=importdata('letter-recognition.data',',');

%Dividing the dataset as train(X,Y) and test(X,Y)
%testY is used as the ground truth
trainX_temp=MLdata.data(1:15000,1:16);
trainY_temp=MLdata.textdata(1:15000,1);
testX=MLdata.data(15001:20000, 1:16);
ground=MLdata.textdata(15001:20000,1);

%Confusion matrix: Letter classes are recognised.
%Frequency of each letters in 26 class is calculated
%This is stored in array letterfreq.
%
letterclass=unique(ground);
letterfreq=zeros(length(letterclass),1);
for p=1:26
    letterfreq(p)=length(find(strcmp(letterclass{p}, ground)));
end
letterfreq;

%%%%%%%%%%%%%%%%%%
%K-NN for k={1,3,5,7,9} and subsamples={100,1000,2000,5000,10000,15000}

for k=1:2:9%Change the value of K incrementally
    for sample=[100,1000,2000,5000,10000,15000]%For different values of subsample
        
        [trainX ind]=datasample(trainX_temp,sample);%Subsample the trainset
        trainY=trainY_temp(ind);%Alter trainY according to the subsample
        t=cputime;% To calculate runtime of the algorithm for each k,subsample
        testY= testknn( trainX, trainY, testX, k );%call KNN function
        elaptime= cputime-t;%caluclting the end time for particular knn
        truth=strcmp(ground,testY); %Compare ground truth with the result  
        accuracy=(sum(truth)/5000)*100; %calculating accuracy
        %Print results
        fprintf('KNN :: K[%d],Sample[%d],Accuracy[%d],Time[%d sec]\n',k,sample,accuracy,elaptime);
          
    end
end

%%%%%%%%%%%%%%%
%Condensed K-NN for K=1


for sample=[100,1000,2000,5000,10000,15000]%For different values of subsample
     [trainX1 ind]=datasample(trainX_temp,sample);%Subsample the trainset
     trainY1=trainY_temp(ind);;%Alter trainY according to the subsample
     %Condensation Step. The training set is condensed
     condensedIdx=condensedata(trainX1,trainY1);
     trainX=trainX1(condensedIdx,:);
     trainY=trainY1(condensedIdx,1);
    for k=1:2:9%Change the value of K incrementally
        t=cputime;% To calculate runtime of the algorithm for each k,subsample
        testY= testknn( trainX, trainY, testX, k );%call KNN function
        elaptime= cputime-t;%caluclting the end time for particular knn
        truth=strcmp(ground,testY);%Compare ground truth with the result
        accuracy=(sum(truth)/5000)*100;%calculating accuracy
        
        %Print results
        fprintf('Condensed KNN :: where K[%d],Sample[%d],Accuracy[%d],Time[%d sec]\n',k,sample,accuracy,elaptime);
    end
end

%%%%%%%%%%%%%%%%
