classdef Drone < handle
    properties
        pos = struct('x', 0, 'y', 0);%x,y coordinates
        dim = struct('width', 1, 'height', 2);%width , height Drone size
        confidence_level; %calc based on object x,y
        view_sim; %a vector of N-1 similarity values for N - 1 Drones
        dist2drones;
        ecludian_dist2sample= Inf; %distance with respect to the object
        id;
    end
    methods
        function obj = Drone(pos,id)
            obj.pos = struct('x', pos(1),'y', pos(2));
            obj.id = id;
        end
    end
end