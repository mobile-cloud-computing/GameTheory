function coallition_similarity(coallition)
%extract number of drones in coalition
    [r,c] = size(coallition.members);
    temp = 0;
    cLabel = coallition.label;
    for i = 1:c
        [d,m] = size(coallition.members(1,c).view_sim);
        for j = 1:m
            if(contains(coallition.label,num2str(j)))
                temp = temp + coallition.members(1,c).view_sim(1,j);
            end
        end
    disp(temp)
    
end