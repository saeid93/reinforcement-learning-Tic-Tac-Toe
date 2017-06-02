function qTable = stateGenerator
%GENERATOR Summary of this function goes here
%   Detailed explanation goes here


%temprorary template for generating states
temp = [];


%array that holds states with initial state
statesArray = ones(1,9)*3;

%array that have one black temp items
temp = [];
temp = [temp 1];
temp = [temp ones(1,8)*3];
tempStates = unique(perms(temp),'rows');
statesArray = [statesArray ; tempStates];

%array that have one white temp items
temp = [];
temp = [temp 2];
temp = [temp ones(1,8)*3];
tempStates = unique(perms(temp),'rows');
statesArray = [statesArray ; tempStates];



%equal number of piece states
for i = 1:4
    temp = [];
    for j = 1:i
        temp = [temp 1];
        temp = [temp 2];
    end
    temp = [temp ones(1,9 - 2*i)*3];
    tempStates = unique(perms(temp),'rows');
    statesArray = [statesArray ; tempStates];
end


%one more black piece states
for i = 1:4
    temp = [];
    for j = 1:i
        temp = [temp 1];
        temp = [temp 2];
    end
    temp = [temp 1];
    temp = [temp ones(1,9 - 2*i - 1)*3];
    tempStates = unique(perms(temp),'rows');
    statesArray = [statesArray ; tempStates];
end


%one more white piece states
for i = 1:4
    temp = [];
    for j = 1:i
        temp = [temp 1];
        temp = [temp 2];
    end
    temp = [temp 2];
    temp = [temp ones(1,9 - 2*i - 1)*3];
    tempStates = unique(perms(temp),'rows');
    statesArray = [statesArray ; tempStates];
end

sizeOfStateArray = size(statesArray);
numberOfStates = sizeOfStateArray(1);


tempIntegerState = 0;
stateIntegerArray = [];
for i = 1:numberOfStates
    tempIntegerState = 0;
    for j = 0:8
        tempIntegerState = tempIntegerState + statesArray(i,j+1) * (10^(8-j));
    end
    stateIntegerArray = [stateIntegerArray ; tempIntegerState];
end

% qTable = ones(333333333,1)*(-1);
% for i = 1:numberOfStates
%     qTable(stateIntegerArray(i,1)) = 0;
% end
intitialQValue = 30;
qTable = [stateIntegerArray ones(numberOfStates,1) * intitialQValue];


end

