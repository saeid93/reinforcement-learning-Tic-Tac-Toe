function typeOfState = rewardedStateOrNot( tempBoard )
%REWARDEDSTATEORNOT Summary of this function goes here
%   Detailed explanation goes here
%tempBoard = qTable2BoardIndex(tempBoardIndex);

typeOfState = 1;
% 1 not rewarded
% 2 rewarded but not final
% 3 final

color = 2;



% 2 rewarded but not final
%row
% * * 0
for i = 1:3
    if tempBoard(i,1) == color && tempBoard(i,2) == color && tempBoard(i,3) == 3
        typeOfState = 2;
        return;
    end
end
% 0 * *
for i = 1:3
    if tempBoard(i,1) == 3 && tempBoard(i,2) == color && tempBoard(i,3) == color
        typeOfState = 2;
        return;
    end
end

%column
% *
% * 
% 0 

for i = 1:3
    if tempBoard(1,i) == color && tempBoard(2,i) == color && tempBoard(3,i) == 3
        typeOfState = 2;
        return;
    end
end
% 0
% *
% *

for i = 1:3
    if tempBoard(1,i) == 3 && tempBoard(2,i) == color && tempBoard(3,i) == color
        typeOfState = 2;
        return;
    end
end
%diagonal

% * 0
% 0 *

% * 0 0 
% 0 * 0 
% 0 0 0 

if tempBoard(1,1) == color && tempBoard(2,2) == color && tempBoard(3,3) == 3
    typeOfState = 2;
    return;
end
% 0 0 0
% 0 * 0 
% 0 0 * 
if tempBoard(1,1) == 3 && tempBoard(2,2) == color && tempBoard(3,3) == color
    typeOfState = 2;
    return;
end


% 0 *
% * 0

% 0 0 *
% 0 * 0
% 0 0 0
if tempBoard(1,3) == color && tempBoard(2,2) == color && tempBoard(3,1) == 3
    typeOfState = 2;
    return;
end
% 0 0 0
% 0 * 0
% * 0 0
if tempBoard(1,3) == 3 && tempBoard(2,2) == color && tempBoard(3,1) == color
    typeOfState = 2;
    return;
end




% 3 final
%row
% * * *
for i = 1:3
    if tempBoard(i,1) == color && tempBoard(i,2) == color && tempBoard(i,3) == color
        typeOfState = 3;
        return;
    end
end
% * * *
for i = 1:3
    if tempBoard(i,1) == color && tempBoard(i,2) == color && tempBoard(i,3) == color
        typeOfState = 3;
        return;
    end
end

%column
% *
% * 
% * 

for i = 1:3
    if tempBoard(1,i) == color && tempBoard(2,i) == color && tempBoard(3,i) == color
        typeOfState = 3;
        return;
    end
end
% *
% *
% *

for i = 1:3
    if tempBoard(1,i) == color && tempBoard(2,i) == color && tempBoard(3,i) == color
        typeOfState = 2;
        return;
    end
end
%diagonal

% * 0 0 
% 0 * 0 
% 0 0 * 

if tempBoard(1,1) == color && tempBoard(2,2) == color && tempBoard(3,3) == color
    typeOfState = 3;
    return;
end

% 0 0 *
% 0 * 0
% * 0 0
if tempBoard(1,3) == color && tempBoard(2,2) == color && tempBoard(3,1) == color
    typeOfState = 3;
    return;
end

end

