%{
oralc / game_theory / MBE Lecture 

a11 = 1;a12 = 5;a21 = 0;a22 = 2;
A = [a11, a12; a21, a22]
%}
function [game_value, p1_strategy, p2_strategy] = game_solver(A)
    %If A is not a 2x2 matrix, throw an error
    if ~isequal(size(A), [2 2])
        error('This function only works for 2x2 games');
    end
    
    % Initialize output variables
    game_value = NaN;
    p1_strategy = [0; 0];
    p2_strategy = [0; 0];

    % Find row minima and column maxima
    row_min = min(A, [], 2);
    col_max = max(A, [], 1);

    % Check for saddle points
    for i = 1:2
        for j = 1:2
            if A(i, j) == row_min(i) && A(i, j) == col_max(j)
                game_value = A(i, j);
                p1_strategy(i) = 1;
                p2_strategy(j) = 1;
                fprintf('Saddle point at (%d, %d) with value %.2f\n', i, j, game_value);
                return
                print(game_value)
            end
        end
    end

    % If there is no saddle point, we need to find the mixed strategies
    fprintf('No saddle point found. Mixed strategy required for this game.\n');
end
