clear; close all; clc;

% define some variable
I = 4;
J = 5;
R = 3;

% generate basisMatrix, coefficientMatrix
basisMatrix = generateFullrankMatrix(I, R);
coefficientMatrix = generateFullrankMatrix(R, J);

% caluclate X
X = basisMatrix * coefficientMatrix;

% check matrix
disp(X);
disp(basisMatrix);
disp(coefficientMatrix);

% check ranks
disp(rank(X));
disp(rank(basisMatrix));
disp(rank(coefficientMatrix));

function fullrankMatrix = generateFullrankMatrix(row, column)
fullrankMatrix = zeros(row, column);
while rank(fullrankMatrix) < min(row, column)
    fullrankMatrix = rand(row, column);
end
end