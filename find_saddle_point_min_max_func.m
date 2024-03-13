% oralc / game theory / MBE Lecture
clc; clear

benefitMatrix = [1 3; 0 2];


if (size(benefitMatrix, 1) > 2 || size(benefitMatrix, 2) > 2)
    error('You cant play the game. Matrix size exceeds 2x2.');
end

% Analyze the matrix and feedback potential saddle points
minRowValues = min(benefitMatrix, [], 2);
maxColumnValues = max(benefitMatrix, [], 1);
maxMinValue = max(minRowValues);
minMaxValue = min(maxColumnValues);

if maxMinValue == minMaxValue
    disp(['Saddle point found at value: ', num2str(maxMinValue)]);
else
    disp('No saddle point found. Game does not have a dominant strategy.');
    return; %terminate
end

% Output the value of the given game
gameValue = maxMinValue; % same as minMaxValue
disp(['Game value: ', num2str(gameValue)]);

% Output the best strategy for each player
player1Strategy = find(maxMinValue == minRowValues); % Player 1 (row player) chooses the row with the maximum of its minimum payoffs
player2Strategy = find(minMaxValue == maxColumnValues); % Player 2 (column player) chooses the column with the minimum of its maximum payoffs

disp(['Player 1 best strategy: Choose row ', num2str(player1Strategy)]);
disp(['Player 2 best strategy: Choose column ', num2str(player2Strategy)]);

