function rewardedStates = rewardedStateGenerator(qTable)
%REWARDEDSTATEGENERATOR Summary of this function goes here
%   Detailed explanation goes here


rewardedStates = [];
rewardedState2BeAdded = [];


typeOfState = 0;

numOfStates = size(qTable);
numOfStates = numOfStates(1);

for i = 1:numOfStates
    tempBoardIndex = qTable(i,1);
    tempBoard = qTable2BoardIndex(tempBoardIndex);
    typeOfState = rewardedStateOrNot(tempBoard);
    if typeOfState == 2
        rewardedState2BeAdded = [];
        rewardedState2BeAdded = [rewardedState2BeAdded tempBoardIndex];
        rewardedState2BeAdded = [rewardedState2BeAdded 502];
        rewardedStates = [rewardedStates ; rewardedState2BeAdded];
    elseif typeOfState == 3
        rewardedState2BeAdded = [];
        rewardedState2BeAdded = [rewardedState2BeAdded tempBoardIndex];
        rewardedState2BeAdded = [rewardedState2BeAdded 100];
        rewardedStates = [rewardedStates ; rewardedState2BeAdded];
    end
end



end

