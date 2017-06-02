function option = randomNessOptimizer( epsilon )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
option = 0;

randomNessVariable = rand(1);
if randomNessVariable >= epsilon
    option = 1;
else
    option = 2;
end

end

