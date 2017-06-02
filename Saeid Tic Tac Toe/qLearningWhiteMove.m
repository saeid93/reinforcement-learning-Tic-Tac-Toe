function qLearningWhiteMove(qTable , epsilon)
%QLEARNINGMOVE make move by qLearning table
%   Detailed explanation goes here


global board;
global emptyBoardIndexes;



randomOrQLearningMove = 0;
randomOrQLearningMove = randomNessOptimizer(epsilon);


if randomOrQLearningMove == 1
    randomWhiteMove;
elseif randomOrQLearningMove == 2
    sizeOfEmptyBoardIndexes = size(emptyBoardIndexes);
    sizeOfEmptyBoardIndexes = sizeOfEmptyBoardIndexes(2);
    
    board2QtableIndexArray = [];
    tempBoard2QtableIndex = 0;
    
    for i = 1:sizeOfEmptyBoardIndexes
        tempBoard = board;
        toBeFilled = emptyBoardIndexes(i);
        tempBoard(toBeFilled.x,toBeFilled.y) = 2;
        tempBoard2QtableIndex = board2QtableIndex(tempBoard);
        board2QtableIndexArray = [board2QtableIndexArray ; tempBoard2QtableIndex];
    end
    
    %size of possible next move
    sizeOfBoard2QtableIndexArray = size(board2QtableIndexArray);
    sizeOfBoard2QtableIndexArray = sizeOfBoard2QtableIndexArray(1);
    qTableIndex = 0;
    
    
    tempQTableValue = 0;
    selectedQTableValue = 0;
    selectedStateboardFormation = 0;
    
    for i = 1:sizeOfBoard2QtableIndexArray
        qTableIndex = find(qTable==board2QtableIndexArray(i,1));
        tempQTableValue = qTable(qTableIndex,2);
        if tempQTableValue > selectedQTableValue
            selectedQTableValue = tempQTableValue;
            selectedStateboardFormation = board2QtableIndexArray(i,1);
            indexToBeFilled = i;
        end
    end
    
    
    if sizeOfEmptyBoardIndexes ~= 0
        board = qTable2BoardIndex(selectedStateboardFormation);
        emptyBoardIndexes(indexToBeFilled) = [];
    end
end



end

