function [ condensedIdx ] = condensedata( trainX, trainY )
%CONDENSED KNN (CNN)

%%%To remove the outliers
len=length(trainY);%Length of training set
temp_index=[];%Temporary index array to store the data set without outliers
for i=1:len% for each row in training set
    
    % Check it with all other rows in the training set
    %Using euclidean distance
    distance=pdist2(trainX(1:len,:),trainX(i,:),'euclidean');
    
    %Now check the min distance. 
    [M I]=sort(distance);
    if strcmp(trainY(I(2),1),trainY(i,1))%We select the non zero min hence the second eleement
        temp_index=[temp_index i]; %Updating the temporary index array     
    end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%New dataset without outliers
tempX=trainX(temp_index,:);
tempY=trainY(temp_index,1);

%To remove the absorbed data
r=length(tempX);%Length of the new dataset
R = randperm(r);%Random selection of data in vector R

%CondensedIdx will be the final dataset
condensedIdx=[temp_index(R(1))];%Initializing the condensedIdx array with
% index of First random element from the new dataset. 
finalX=[tempX(R(1),:)];%Prototype dataset
finalY=[tempY(R(1),1)];
counter=2;
for loop=2:r
    f=length(finalX);%Initially 1 in the first pass
        %For second element
        if loop==2 || f==1
            if(strcmp(finalY(1,:),tempY(R(loop),:))==0)%Compare the two rows
                finalX(counter,:)=tempX(R(loop),:);%If wrongly classified
                finalY(counter,1)=tempY(R(loop),:);
                condensedIdx=[condensedIdx temp_index(loop)];%Update 
                counter=counter+1;
            end
        
        else
            %Find distance of new element from data from outlier
            %with all the eleements from prototype
            distance2=pdist2(finalX(:,:),tempX(R(loop),:),'euclidean');
            [Mi Ii]=sort(distance2);
            
                if(strcmp(finalY(Ii(1),:),tempY(R(loop),:))==0)%Compare the two rows
                    finalX(counter,:)=tempX(R(loop),:);%If wrongly classified
                    finalY(counter,1)=tempY(R(loop),:);
                    counter=counter+1;
                    condensedIdx=[condensedIdx temp_index(loop)];%Update
                end
        end
end       

%%%%%%%%%%%%%%%%%%%



end

