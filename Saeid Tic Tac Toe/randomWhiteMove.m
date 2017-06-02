function randomWhiteMove
%WHITEMOVE Summary of this function goes here
%   Detailed explanation goes here


global board;
global emptyBoardIndexes;

sizeOfEmptyBoardIndexes = size(emptyBoardIndexes);
sizeOfEmptyBoardIndexes = sizeOfEmptyBoardIndexes(2);



if sizeOfEmptyBoardIndexes ~= 0
    indexToBeFilled = randi(sizeOfEmptyBoardIndexes);
    toBeFilled = emptyBoardIndexes(indexToBeFilled);
    board(toBeFilled.x,toBeFilled.y) = 2;
    emptyBoardIndexes(indexToBeFilled) = [];
end

end

