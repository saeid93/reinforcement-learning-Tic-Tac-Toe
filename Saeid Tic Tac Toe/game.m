function game
%Start point of the program


%I defined the board in a 5*5 glbal matrix
global board;
board = [3 3 3 ; 3 3 3 ; 3 3 3];
qTable = stateGenerator;
rewardedStates = rewardedStateGenerator(qTable);


%keeping track of the board empty indexes
global emptyBoardIndexes;
emptyBoardIndexes = [];
for i = 1:3
    for j = 1:3
        boardItems.x = i;
        boardItems.y = j;
        emptyBoardIndexes = [emptyBoardIndexes boardItems];
    end
end




%choose how to run the program
typeOfTraining = 0;
typeOfTraining = input('how do you wish to play?\n1.two random agent\n2.qlearning\n3.sarsa\n');

accReward = 0;
if typeOfTraining == 1
%    accReward = 0;
    while isGameFinishedChecker ~= 1
        randomBlackMove;
        disp(board);
        fprintf('\n---------------------\n');
        if isGameFinishedChecker ~= 1
            %qLearningWhiteMove(qTable);
            randomWhiteMove;
            disp(board);
            fprintf('\n---------------------\n');
        else
            break;
        end        
    end
    
elseif typeOfTraining == 2
    arrayOfRewards = [];
    numOfTrainEpisodes = 0;
    numOfTrainEpisodes = input('Enter the number of episodes you wish to train your agent:\n');
    for i = 1:numOfTrainEpisodes
        while isGameFinishedChecker ~= 1
            accReward = 0;
            %fprintf('11\n');
            randomBlackMove;
            %disp(board);
            %fprintf('\n---------------------\n');
            if isGameFinishedChecker ~= 1
                [qTable,reward] = qLearning(qTable , rewardedStates);
              %  disp(board);
              %  fprintf('\n---------------------\n');
              accReward = accReward + reward;
            else
                break;
            end
        end
        board = [3 3 3 ; 3 3 3 ; 3 3 3];
        
        emptyBoardIndexes = [];
        for j = 1:3
            for k = 1:3
                boardItems.x = j;
                boardItems.y = k;
                emptyBoardIndexes = [emptyBoardIndexes boardItems];
            end
        end
        arrayOfRewards = [arrayOfRewards accReward];
    end
    temp = 0;
    accmulatedBy100 = [];
    sizeOfreward = size(arrayOfRewards);
    sizeOfreward = sizeOfreward(2);
    for k = 1:sizeOfreward
        temp = temp + arrayOfRewards(k);
        if rem(k,10) == 0
            accmulatedBy100 = [accmulatedBy100 temp];
            temp = 0;
        end
        
    end
    plot(accmulatedBy100);
    while isGameFinishedChecker ~= 1
        randomBlackMove;
        disp(board);
        fprintf('\n---------------------\n');
        if isGameFinishedChecker ~= 1
              qLearningWhiteMove(qTable,1)
              disp(board);
              fprintf('\n---------------------\n');
        else
            break;
        end
    end
    
    
elseif typeOfTraining == 3
    arrayOfRewards = [];
    numOfTrainEpisodes = 0;
    numOfTrainEpisodes = input('Enter the number of episodes you wish to train your agent:\n');
    for i = 1:numOfTrainEpisodes
        while isGameFinishedChecker ~= 1
            accReward = 0;
            %fprintf('11\n');
            randomBlackMove;
            %disp(board);
            %fprintf('\n---------------------\n');
            if isGameFinishedChecker ~= 1
                [qTable,reward] = sarsaLearning(qTable , rewardedStates);
              %  disp(board);
              %  fprintf('\n---------------------\n');
              accReward = accReward + reward;
            else
                break;
            end
        end
        board = [3 3 3 ; 3 3 3 ; 3 3 3];
        
        emptyBoardIndexes = [];
        for j = 1:3
            for k = 1:3
                boardItems.x = j;
                boardItems.y = k;
                emptyBoardIndexes = [emptyBoardIndexes boardItems];
            end
        end
        arrayOfRewards = [arrayOfRewards accReward];
    end
    temp = 0;
    accmulatedBy100 = [];
    sizeOfreward = size(arrayOfRewards);
    sizeOfreward = sizeOfreward(2);
    for k = 1:sizeOfreward
        temp = temp + arrayOfRewards(k);
        if rem(k,100) == 0
            accmulatedBy100 = [accmulatedBy100 temp];
            temp = 0;
        end
        
    end
    plot(accmulatedBy100);
    while isGameFinishedChecker ~= 1
        randomBlackMove;
        disp(board);
        fprintf('\n---------------------\n');
        if isGameFinishedChecker ~= 1
              qLearningWhiteMove(qTable,1)
              disp(board);
              fprintf('\n---------------------\n');
        else
            break;
        end
    end
    
    while isGameFinishedChecker ~= 1
        randomBlackMove;
        disp(board);
        fprintf('\n---------------------\n');
        if isGameFinishedChecker ~= 1
              qLearningWhiteMove(qTable,1)
              disp(board);
              fprintf('\n---------------------\n');
        else
            break;
        end
    end
    
    
end





[typeOfWinning , winner] = determineWinner;
if  typeOfWinning == 1
    fprintf('winner determined by 3 consecutive piece\n');
    fprintf('and the winner is:\n');
    if winner == 1
        fprintf('black player\n');
    elseif winner == 2
        fprintf('white player\n');
    end
elseif typeOfWinning == 2
    blackScore = calculateScores(1);
    whiteScore = calculateScores(2);
    fprintf('winner determined by credit\n');
    fprintf('black score: %d\n',blackScore);
    fprintf('white score: %d\n', whiteScore);
    if winner == 1
        fprintf('and the winner is:\n');
        fprintf('black player\n');
    elseif winner == 2
        fprintf('and the winner is:\n');
        fprintf('white player\n');
    elseif winner == 3
        fprintf('the game is a tie\n');
    end
end

end