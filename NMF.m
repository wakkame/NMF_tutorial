clear; close all; clc;

% define some variable
I = 100;
J = 200;
R = 10;

% generate X1, X2
X1 = generateFullrankMatrix(I, R);
X2 = generateFullrankMatrix(R, J);

% caluclate X
X = X1 * X2;

% check matrix
displayColorMap(X);

function fullrankMatrix = generateFullrankMatrix(row, column)
fullrankMatrix = zeros(row, column);
while rank(fullrankMatrix) < min(row, column)
    fullrankMatrix = rand(row, column);
end
end

function [] = displayColorMap(matrix)
figure;
imagesc(matrix);
axis xy;
set(gca, "FontSize", 18, "FontName", "Times");
end