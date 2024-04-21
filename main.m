clear; close all; clc;

% define some variable
windowLength = 2 ^ 11;
shiftLength = 2 ^ 10;
windowType = "han";
paddingMethod = "end";
K = 20;
nIter = 1000;

% loading audio files
[inputSignal, fs] = audioread("guitar.wav");

% calculate STFT
F = DGTtool("windowShift", shiftLength, ...
            "windowLength", windowLength, ...
            "FFTnum", windowLength, ...
            "windowName", windowType);
S = F(inputSignal);
S(windowLength / 2 + 1, :) = [];
F.plot(inputSignal, fs);

% calulate amplitude spectrogram
X = abs(S);

% execute calcNMF
[W, H, WH] = calcNMF(X, ...
                     "K", K, ...
                     "nIter", nIter);

% check matrixs
displayColorMap(X);
displayColorMap(W);
displayColorMap(H);
displayColorMap(WH);

function [] = displayColorMap(matrix)
figure;
imagesc(matrix);
axis xy;
set(gca, "FontSize", 18, "FontName", "Times");
end
