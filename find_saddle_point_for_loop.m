clc; clear

a11 = 1;
a21 = 0;
a22 = 2;
c_range = -5:1:5;  

for c = c_range
    A = [a11, c; a21, a22];

    for i = 1:size(A, 1)
        for j = 1:size(A, 2)

            %when the element is the smallest of its row and largest of its
            %column it is saddle point
            if all(A(i,j) < (A(i, :))) && all(A(i,j) > A(:, j))
                fprintf('SP found at A[%d,%d] = %.1f when c = %.1f\n', i, j, A(i,j), c)
            else
                fprintf('SP NOT found at A[%d,%d] = %.1f when c = %.1f\n', i, j, A(i,j), c)
            end
        end
    end
end























