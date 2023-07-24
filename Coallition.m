classdef Coallition < handle
    properties
        droneNum; %number of drones in Coallition
        members; %each member is a class of Drone with its properties
        label = '{';
        avg_similarity;
    end
    
    methods
        function obj = Coallition(v)
            obj.members=v;
            d = size(obj.members);
            obj.droneNum = d(1,2);
        end
        function showDrones()
        end
    end
end