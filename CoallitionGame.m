% example of a game with one population and three strategies per population.
clear
%Create Folder for dataset
folderName = strcat(pwd,'\','test');
if (~exist(folderName,'dir'))
    mkdir(folderName);
end
%%%%%%%%%%%%%%%%%%%%%%%%% WRITE EXCEL HEADER %%%%%%%%%%%%%%%%%
folderName = strcat(pwd,'\','test');
File = strcat(folderName,'/','DatasetNew.xlsx');
%col_header={'P1','P2','P3','P4','P5','P6','P7','P8','P9','sample','distTh','angTh','coallition'};     %Row cell array (for column labels)
col_header={'P1','P2','P3','distTh','angTh','coallition'};     %Row cell array (for column labels)

xlswrite(File,col_header,'Sheet1','A1');     %Write column header
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Swarm Definition
droneCount = 3;
global sample
global drones1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global distThreshold;
global angle_simThreshold;
%%%%%%%%%%%%%%%%%%%%%%%%%%   ITERATIION BEGINS    %%%%%%%%%%%%%%%%%
for row = 840:940
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    sample = [randi([1,15]) randi([1,15])];
    sampleStrCoord = string(strcat(num2str(sample(1,1)),',',num2str(sample(1,2))));
    id = 1;
    for i=1:droneCount
         drones(1,i) = Drone([randi([1,15]), randi([1,15])],id);
         droneCoords(1,i) = string(strcat(num2str(drones(1,i).pos.x),',',num2str(drones(1,i).pos.y)));
         drones(1,i).ecludian_dist2sample = dist2sample([drones(1,i).pos.x drones(1,i).pos.y],sample);
         id = id + 1;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%% MANUAL VALUES %%%%%%%%%%%%%%%%%%%%%%%%%%%
%     drones(1,1) = Drone([randi([1,15]), randi([1,15])],id);
%     droneCoords(1,i) = string(strcat(num2str(drones(1,i).pos.x),',',num2str(drones(1,i).pos.y)));
%     drones(1,i).ecludian_dist2sample = dist2sample([drones(1,i).pos.x drones(1,i).pos.y],sample);

    %CALCULATE ANGULAR SIMILARITY BETWEEN DRONES WITH RESPECT TO THE SAMPLE
    %COORDINATES
    for i=1:droneCount
        for j=1:droneCount
            if i==j
                drones(1,i).view_sim(j) = eps;
               continue
            else
                %drones(1,i).view_sim(j) = similarity([drones(1,i).pos.x drones(1,i).pos.y],[drones(1,j).pos.x drones(1,j).pos.y],sample);
                drones(1,i).view_sim(j) = atan2similarity([drones(1,i).pos.x drones(1,i).pos.y],[drones(1,j).pos.x drones(1,j).pos.y],sample);
                drones(1,i).dist2drones(j) = dist2sample([drones(1,i).pos.x drones(1,i).pos.y],[drones(1,j).pos.x drones(1,j).pos.y]);
            end
    
        end
    end
    drones1 = drones;
    subsets = subsetsCount(drones); % extract 2^n possible subsets
    strategy = extractStrategies(subsets,droneCount); %extract the strategies out of subsets
    extractLabels(subsets,strategy);  %Assign labels to coalitions
    [r,c] = size(strategy);
    %Strategy has Columns correspanding to number of strategies
    % number of populations
    P = droneCount;
    % number of pure strategies per population
    n = c;
    % mass of the population
    m = 1;
    % initial condition
    for i=1:n-1
        x0(1:P, i) =(1/n)*exp(-(1/n)*i);
    end
    x0(1:P, n) = 1- sum(x0(1, 1:n-1));
    %Strategies
    global strategies;
    strategies = strategy;
    % simulation parameters
    time = 10;
    % structure with the parameters of the game
    % verify data of the game
    dyn = {'rd', 'maynard_rd', 'bnn', 'smith', 'logit'};
    gamma = [0 1 0 0 0];
    global G;
    G = struct('P', P, 'n', n,'f', @myFitness, 'x0', x0, 'dynamics', {dyn}, 'gamma', gamma, 'ode', 'ode15s', 'time', time, 'tol', 0.000001, 'step', .01);
    G.eta = .02;
    %G.dynamics = {'rd'};
    G = definition(G);
    %Calculate payoff matrix
    expectedPayOffCalc();
    G.run();
    %%%%%%%%%%%%%%%%% FIND Selected Strategies by Players %%%%%%%%
    counter = 1;
    selected = strings(1,P);
    for i=1:P
        maximum = max(max(G.X(end,counter:i*n)));
        dummy=find(G.X(end,counter:i*n)==maximum);
        selected(1,i) = strategies(i,dummy).label;
        counter = (i*n) + 1;
    end
    dummy = 2;
    dummySelected = '{}';
    for i=1:P
        temp = strlength(selected(1,i));
        if temp > dummy
            dummy = temp;
            dummySelected = selected(1,i);
        end
    end
    coallition_formed = string(dummySelected);
    %%%%%%%%%%%%%%%%%%%%% SAVE DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%
    saveData(row,droneCoords,distThreshold,angle_simThreshold,sampleStrCoord,coallition_formed);
end
% G.graph();
% G.graph_evolution();

%G1 = struct('n', n, 'f', @fitness1, 'x0', x0, 'ode', 'ode113', 'time', time,  'tol', 0.000001, 'step', .01);

% verify data of the game
%G.run()
%G.graph()
%G.graph_evolution()

% disp (['Press any key to continue Mynard Replicator Dynamics...', sprintf('\n') ]);
% pause
% 
% 
% G.dynamics = {'maynard_rd'};
% G.run()
% G.graph()
% G.graph_evolution()
% 
% disp (['Press any key to continue for BNN Dynamics...', sprintf('\n') ]);
% pause
% 
% 
% G.dynamics = {'bnn'};
% G.run()
% G.graph()
% G.graph_evolution()
% 
% disp (['Press any key to continue for Smith Dynamics...', sprintf('\n') ]);
% pause
% 
% 
% G.dynamics = {'smith'};
% G.run()
% G.graph()
% G.graph_evolution()
% 
% disp (['Press any key to continue for Logit Dynamics...', sprintf('\n') ]);
% pause
% 
% 
% G.dynamics = {'logit'};
% G.eta = .02;
% G.run()
% G.graph()
% G.graph_evolution()

