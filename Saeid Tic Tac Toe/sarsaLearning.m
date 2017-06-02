function [qTable,reward] = sarsaLearning(qTable , rewardedStates)
%SARSALEARNING Summary of this function goes here
%   Detailed explanation goes here


global board;


alpha = 0.5;
gamma = 0.5;
reward = 0;


currentState = board2QtableIndex(board);

%should become probabilistic in the next version
nextState = sarsaLearningWhiteMove(qTable,0.5);

afterNextState = board2QtableIndex(board);

currentStateQTableIndex = find(qTable==currentState);
nextStateQTableIndex = find(qTable==nextState);
afterNextStateQTableIndex = find(qTable==afterNextState);


currentStateRewardIndex = find(rewardedStates==nextState);


if isempty(currentStateRewardIndex) == 1
    reward = 0;
elseif isempty(currentStateRewardIndex) == 0
    reward = rewardedStates(currentStateRewardIndex , 2);
end


qTable(currentStateQTableIndex,2) = qTable(currentStateQTableIndex,2) + ...
    alpha * (reward + gamma* (qTable(afterNextStateQTableIndex,2) - qTable(currentStateQTableIndex,2)));

end