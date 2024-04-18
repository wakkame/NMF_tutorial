clear; close all; clc;

% define some variable
I = 4;
J = 5;
R = 3;

% generate W, H
W = generateFullrankMatrix(I, R);
H = generateFullrankMatrix(R, J);

% caluclate X
X = W * H;

% check matrix
disp(X);
disp(W);
disp(H);

% check ranks
disp(rank(X));
disp(rank(W));
disp(rank(H));

function A = generateFullrankMatrix(row, column)
A = zeros(row, column);
while rank(A) < min(row, column)
    A = rand(row, column);
end
end