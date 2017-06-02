function [typeOfWinning , winner] = determineWinner
%DETERMINEWINNER Summary of this function goes here
%   winner by row typeOfWinnnting --> 1
%   winner by score typeOfWinning --> 2
%   winner -->
%             black --> 1
%             white --> 2


global board;
global emptyBoardIndexes;


typeOfWinning = 0;
winner = 0;



% first situiation that we consider the game as finished
sizeOfEmptyBoardIndexes = size(emptyBoardIndexes);
sizeOfEmptyBoardIndexes = sizeOfEmptyBoardIndexes(2);





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
            winner = tempFirstValueHolder;
            typeOfWinning = 1;
        end
    end
end
if  typeOfWinning ~= 1
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
                winner = tempFirstValueHolder;
                typeOfWinning = 1;
            end
        end
    end
end




%diagonal finish states
if  typeOfWinning ~= 1
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
            winner = tempFirstValueHolder;
            typeOfWinning = 1;
        end
    end
end


if  typeOfWinning ~= 1
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
            winner = tempFirstValueHolder;
            typeOfWinning = 1;
        end
    end
end



if typeOfWinning ~= 1
    blackScore = 0;
    whiteScore = 0;
    %if the winner is goning to be determined by the
    if winner == 0
        typeOfWinning = 2;
        blackScore = calculateScores(1);
        whiteScore = calculateScores(2);
    end
    if blackScore > whiteScore
        winner = 1;
    elseif blackScore < whiteScore
        winner = 2;
    elseif blackScore == whiteScore
        winner = 3;
    end
end



end

