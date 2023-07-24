% We need different A's [Quantify each strategy somehow] for each player How to quantify A's for different strategies? 
function f_i = myFitness(x, p)
global expectedpayOffs
global G;
for i=1:G.n
            f_i(i) = expectedpayOffs(p, i)*x(p,i); %% if the strategy does not violate the min
end
end
