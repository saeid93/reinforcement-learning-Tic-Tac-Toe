function [qTable,reward] = qLearning(qTable , rewardedStates)
%QLEARNING qLearning function
%   Detailed explanation goes here


global board;


alpha = 0.5;
gamma = 0.5;
epsilon = 0.5;
reward = 10;


currentState = board2QtableIndex(board);

%should become probabilistic in the next version
qLearningWhiteMove(qTable,epsilon);
epsilon = 0.999 * epsilon;

nextState = board2QtableIndex(board);

currentStateQTableIndex = find(qTable==currentState);
nextStateQTableIndex = find(qTable==nextState);


currentStateRewardIndex = find(rewardedStates==nextState);


if isempty(currentStateRewardIndex) == 1
    reward = 0;
elseif isempty(currentStateRewardIndex) == 0
    reward = rewardedStates(currentStateRewardIndex , 2);
end


qTable(currentStateQTableIndex,2) = qTable(currentStateQTableIndex,2) + ...
    alpha * (reward + gamma* (qTable(nextStateQTableIndex,2) - qTable(currentStateQTableIndex,2)));
end

