function finishedOrNot = isGameFinishedChecker
%ISGAMEFINISHEDCHECKER This fuction checks whether the gaeme is done or not
%   There is two possible state for a game to finish
%       1. one player have 5 consecutive piece
%       2. there is no more empty index to put the pieces


global board;
global emptyBoardIndexes;

%the variable that sh
finishedOrNot = 0;

% first situiation that we consider the game as finished
sizeOfEmptyBoardIndexes = size(emptyBoardIndexes);
sizeOfEmptyBoardIndexes = sizeOfEmptyBoardIndexes(2);
if sizeOfEmptyBoardIndexes == 0
    finishedOrNot = 1;
    
    % second situiation that we consider the game as finished
else
    tempFirstValueHolder = 3;
    
    %
    for i = 1:3
        tempFirstValueHolder = board(i,1);
        if tempFirstValueHolder == 3
            continue;
        end
        for j = 2:3
            if tempFirstValueHolder ~= board(i,j)
                break;
            end
            if j == 3
                finishedOrNot = 1;
            end
        end
    end
    tempFirstValueHolder = 3;
    for i = 1:3
        tempFirstValueHolder = board(1,i);
        if tempFirstValueHolder == 3
            continue;
        end
        for j = 2:3
            if tempFirstValueHolder ~= board(j,i)
                break;
            end
            if j == 3
                finishedOrNot = 1;
            end
        end
    end
    
    
    
    
    %diagonal finish states
    tempFirstValueHolder = 3;
    for i = 1:3
        tempFirstValueHolder = board(1,1);
        if tempFirstValueHolder == 3
            continue;
        end
        if tempFirstValueHolder ~= board(i,i)
            break;
        end
        if i == 3
            finishedOrNot = 1;
        end
    end
    tempFirstValueHolder = 3;
    for i = 3:-1:1
        tempFirstValueHolder = board(1,3);
        if tempFirstValueHolder == 3
            continue;
        end
        if tempFirstValueHolder ~= board((3-i)+1,i)
            break;
        end
        if i == 1
            finishedOrNot = 1;
        end
    end    
    
end


end

