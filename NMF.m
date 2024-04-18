clear; close all; clc;

% I = 4, J = 5, R = 4
W = [1, 2, 3, 0;
     2, 3, 0, 5;
     3, 0, 5, 6;
     0, 5, 6, 7];

J = [1, 2, 3, 4, 5;
     9, 3, 4, 5, 6;
     3, 4, 5, 6, 7;
     4, 5, 9, 7, 8];

X = W * J;

disp(X);
disp(rank(W));
disp(rank(J));
disp(rank(X));