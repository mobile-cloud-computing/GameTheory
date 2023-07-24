%EXTRACT POSSIBLE STRATEGIES FOR EVERY DRONE (FULL STRATEGIES MATRIX)
function st = extractStrategies(s,droneCount)
strategy = Coallition.empty;
for k=1:droneCount
    counter = 1;
    strategy(k,counter) = zeros(1,1);
    for i=1:length(s)
        m = s(1,i).droneNum;
        for j=1:m
            if (s(1,i).members(1,j).id == k)
                counter = counter + 1;
                strategy(k,counter) = s(1,i);
                break
            end
        end
    
    end
    strategy(k+1,:) = zeros(1,1);
end
st = strategy(1:end-1,:);