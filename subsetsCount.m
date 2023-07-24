%Put each of possible strategies as an object and add it to array of
%coallitions
function subsets = subsetsCount(drones)
subsets = Coallition.empty;
dronesCount = length(drones);
c = 1;
for k=1:dronesCount
    sC = nchoosek(drones(1:dronesCount),k);
    d = size(sC);
    r = d(1,1);
    for j=1:r
        subsets(1,c) = Coallition(sC(j,:));
        c = c+1;
    end
end