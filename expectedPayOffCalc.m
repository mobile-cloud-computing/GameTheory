function expectedPayOffCalc()
global distThreshold
global angle_simThreshold;
distThreshold = 8;
%angle_simThreshold = 1.57; %90 degree
%angle_simThreshold = 1.1; %70 degree
angle_simThreshold = 0.78; % 60 degree

global strategies;
global G;
global drones1;
global expectedpayOffs
expectedpayOffs = zeros(G.P,G.n);
for i=1:G.n
    for j=1:G.P
        if(i==1)
            expectedpayOffs(j,i)=eps;
        else
            temp = 1;
            temp2=0;
            for k = 1:strategies(j,i).droneNum
                temp=temp* max(sign(distThreshold - strategies(j,i).members(1,k).ecludian_dist2sample),0);
            end                    
            if temp == 0
            expectedpayOffs(j,i) = 0;
            else
                %%%%%%%%%%%%%%%% Dropout similar angle with respect to dis2sample threshold
                for z = 1:strategies(j,i).droneNum
                    val = find(strategies(j,i).members(1,z).view_sim < angle_simThreshold & strategies(j,i).members(1,z).view_sim > eps);
                    val2= string(val);
                    for v = 1:length(val2)
                            if (contains(strategies(j,i).label,val2(v)))
                                temp2 = max(sign(strategies(j,i).members(1,z).ecludian_dist2sample - drones1(1,val(v)).ecludian_dist2sample),0);
                            end
                    end
                
                end
                    

                    if temp2 == 1 %% there is communication cost in this coallition
                        dummy = 0;
                        for k = 1:strategies(j,i).droneNum
                            for v = 1:G.P
                                if (contains(strategies(j,i).label,num2str(v)))
                                    dummy = dummy + strategies(j,i).members(1,k).view_sim(1,v);
                                end
                            end

                        end
                        result = dummy / 2;
                        expectedpayOffs(j,i) = (result / strategies(j,i).droneNum) - 0.3;  
                        %expectedpayOffs(j,i) = 0.3;

                    else
                        %calculateUtility Value if no violation
                        
                        dummy = 0;
                        for k = 1:strategies(j,i).droneNum
                            for v = 1:G.P
                                if (contains(strategies(j,i).label,num2str(v)))
                                    dummy = dummy + strategies(j,i).members(1,k).view_sim(1,v);
                                end
                            end

                        end
                        result = dummy / 2;
                        expectedpayOffs(j,i) = result / strategies(j,i).droneNum;       
                        
                    end

            end
       
        end
    end
end
end
