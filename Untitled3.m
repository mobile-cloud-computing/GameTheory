sample = [5 2];
droneCount = 3;
id = 1;
for i=1:droneCount
    drones(1,i) = Drone([randi([1,50]), randi([1,50])],id);
    drones(1,i).ecludian_dist2sample = dist2sample([drones(1,i).pos.x drones(1,i).pos.y],sample);
    id = id + 1;
end
for i=1:droneCount
    for j=1:droneCount
        if i==j
            drones(1,i).view_sim(j) = 0;
            continue
        else
            drones(1,i).view_sim(j) = similarity([drones(1,i).pos.x drones(1,i).pos.y],[drones(1,j).pos.x drones(1,j).pos.y],sample);
            drones(1,i).dist2drones(j) = dist2sample([drones(1,i).pos.x drones(1,i).pos.y],[drones(1,j).pos.x drones(1,j).pos.y]);

        end

    end
end

s = subsetsCount(drones);
strategies = Coallition.empty;
for k=1:droneCount
    counter = 1;
    strategies(k,counter) = zeros(1,1);
    for i=1:length(s)
        m = s(1,i).droneNum;
        for j=1:m
            if (s(1,i).members(1,j).id == k)
                counter = counter + 1;
                strategies(k,counter) = s(1,i);
                break
            end
        end
    
    end
    strategies(k+1,:) = zeros(1,1);
end
x1 = 5;
y1 = 7;
sample = [2 1];
test1 = [2 4];
test2 = [4 2];
disp(atan2similarity(test1,test2,sample))
% figure
% hold on
% plot(x1,y1,'b--square',x2,y2,'r+','MarkerSize',20,'LineWidth',5);
% plot(x3,y3,'b--o','MarkerSize',20,'LineWidth',5);
% line([15 2],[0,18])
% hold off
% 
% xlim([0 20])
% ylim([0 30])