function score = calculateScores(color)
%CALCULATESCORES 
%   Detailed explanation goes here


global board;
global emptyBoardIndexes;


score = 0;



% 2 set

%row
% * * 0 
for i = 1:3
    if board(i,1) == color && board(i,2) == color && board(i,3) ~= color
        score = score + 4;
    end
end
% 0 * *
for i = 1:3
    if board(i,1) ~= color && board(i,2) == color && board(i,3) == color
        score = score + 4;
    end
end

%column
% *
% * 
% 0 

for i = 1:3
    if board(1,i) == color && board(2,i) == color && board(3,i) ~= color
        score = score + 4;
    end
end
% 0
% *
% *

for i = 1:3
    if board(1,i) ~= color && board(2,i) == color && board(3,i) == color
        score = score + 4;
    end
end
%diagonal

% * 0
% 0 *

% * 0 0 
% 0 * 0 
% 0 0 0 

if board(1,1) == color && board(2,2) == color && board(3,3) ~= color
    score = score + 4;
end
% 0 * 0
% 0 0 *
% 0 0 0
if board(1,2) == color && board(2,3) == color
    score = score + 4;
end
% 0 0 0 
% * 0 0 
% 0 * 0 

if board(2,1) == color && board(3,2) == color
    score = score + 4;
end
% 0 0 0
% 0 * 0 
% 0 0 * 
if board(1,1) ~= color && board(2,2) == color && board(3,3) == color
    score = score + 4;
end


% 0 *
% * 0

% 0 0 *
% 0 * 0
% 0 0 0

if board(1,3) == color && board(2,2) == color && board(3,1) ~= color
    score = score + 4;
end
% 0 * 0
% * 0 0
% 0 0 0
if board(1,2) == color && board(2,1) == color
    score = score + 4;
end

% 0 0 0
% 0 0 *
% 0 * 0
if board(2,3) == color && board(3,2) == color
    score = score + 4;
end
% 0 0 0
% 0 * 0
% * 0 0
if board(1,3) ~= color && board(2,2) == color && board(3,1) == color
    score = score + 4;
end

end

