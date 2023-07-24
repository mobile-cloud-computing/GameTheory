function extractLabels(subsets,strategy)
[droneCount,c] = size(subsets);
[droneCountStrategy,c2] = size(strategy);

for k=1:droneCount
    for i=1:c
        m = subsets(k,i).droneNum;
        temp = subsets(k,i).label;
        for j=1:m
            temp = strcat(temp,num2str(subsets(k,i).members(1,j).id),',');
        end
        temp = strcat(temp(1:end-1), '}');
        subsets(k,i).label = temp;
        
    end
end
for k=1:droneCountStrategy
    strategy(k,1).label = strcat(strategy(k,1).label , '}');
end
end