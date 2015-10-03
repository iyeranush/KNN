function [ testY ] = testknn( trainX, trainY, testX, k )
%KNN function

x=length(trainY);% Check the number of rows of Train set
testY=cell(5000,1);%create cell for testY
for i=1:5000%length_test%Test data row   
    for j=1:x%length_train %One test data will be checked with all train data    
        %distance=0;%Distace from one test to one training data
            difference=trainX(j,:)-testX(i,:);%Euclidean distance
            distance(j,1)=norm(difference);
       
    end
    [V I]=sort(distance);%Sorting the distance array to find top k calues
    top=I(1:k);% top k values
    karray=cell(k,1);
    for m=1:k
        karray(m,1)=trainY(top(m));   %Putting top k distance
    end
    %karray=V(1:k)
    %find most frequent element.
    uniq=unique(karray);%Unique elements in the array
    ktemp=zeros(length(uniq),1);%Length of unique elements as array
    for p=1:length(uniq)
        ktemp(p)=length(find(strcmp(uniq{p}, karray)));%Calculates histogram
    end
    [~,labeltemp]=max(ktemp);%Top element with max frequency
    testY(i,1)=uniq(labeltemp);%Updating the testY data set with the found value.
   
    
end
%This  funtion returns the testY dataset as found by the KNN
%It will then be compared  to the ground truth.
end



