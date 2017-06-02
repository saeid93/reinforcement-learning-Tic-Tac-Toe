function tempBoard = qTable2BoardIndex( qTableIndex )
%QTABLE2BOARDINDEX Summary of this function goes here
%   Detailed explanation goes here


tempBoard = ones(3,3)*3;
boardArray = zeros(1,9);
for i = 8:-1:0
    boardArray(1,9-i) = qTableIndex / (10^(i));
    qTableIndex = rem(qTableIndex, (10^(i))); 
end
boardArray = int32(boardArray);
counter = 1;

for i = 1:3
    for j = 1:3
        tempBoard(i,j) = boardArray(1,counter);
        counter = counter + 1;
    end
end

end

