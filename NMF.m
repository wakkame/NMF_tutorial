clear; close all; clc;

% define some variable
I = 4;
J = 5;
R = 3;

% generate X1, X2
X1 = generateFullrankMatrix(I, R);
X2 = generateFullrankMatrix(R, J);

% caluclate X
X = X1 * X2;

% check matrix
disp(X);
disp(X1);
disp(X2);

% check ranks
disp(rank(X));
disp(rank(X1));
disp(rank(X2));

function fullrankMatrix = generateFullrankMatrix(row, column)
fullrankMatrix = zeros(row, column);
while rank(fullrankMatrix) < min(row, column)
    fullrankMatrix = rand(row, column);
end
end