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
F.plot(inputSignal, fs);

% calulate amplitude spectrogram
X = abs(S);

% execute calcNMF
[W, H, WH] = calcNMF(X, ...
                     "K", K, ...
                     "nIter", nIter);

% change dimension to dB
X = dBTransform(X);
W = dBTransform(W);
H = dBTransform(H);
WH = dBTransform(WH);

% check matrixs
displayColorMap(X);
displayColorMap(W);
displayColorMap(H);
displayColorMap(WH);

% check basis vector
Wn = W(:, 1);
WnAxis = (linspace(0, fs / 2, windowLength / 2 + 1)).';
figure;
plot(WnAxis, Wn);
axis xy;
xlabel("Frequency[Hz]");
set(gca, "FontSize", 18, "FontName", "Times");

function [] = displayColorMap(matrix)
figure;
imagesc(matrix);
axis xy;
set(gca, "FontSize", 18, "FontName", "Times");
end

function [dBMatrix] = dBTransform(matrix)
    dBMatrix = 20 * log10(matrix);
end