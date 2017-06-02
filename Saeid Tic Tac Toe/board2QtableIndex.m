function index = board2QtableIndex(tempBoard)
%BOARD2QTABLEIINDEX Summary of this function goes here
%   Detailed explanation goes here

indexArray = zeros(1,9);

counter = 1;
for i = 1:3
    for j = 1:3
        indexArray(1,counter) = tempBoard(i,j);
        counter = counter + 1;
    end
end


index = 0;

for i = 0:8
    index = index + indexArray(1,i+1) * (10^(8-i));
end


end

