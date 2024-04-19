function [W, H, WH] = calcNMF(X, args)
%-----------------------------description----------------------------------
% calcNMF : using Nonnegative-Matrix-Factrization, approximate input matrix
%
% [Input]
%         X : input matrix (I x J)
%         K : number of basis vector (scalar, default : 10)
%     nIter : number of iteration (scalar, default : 1000)
% 
% [Output]
%         W : basis matrix (I x K)
%         H : coefficient matrix (K x J)
%        WH : multipled matrix (I x J)
%--------------------------------------------------------------------------

% check arguments and set default value
arguments
    X (:, :) double {mustBeReal, mustBeNonnegative}
    args.K (1, 1) double {mustBeInteger, mustBeNonnegative} = 10
    args.nIter (1, 1) double {mustBeInteger, mustBeNonnegative} = 1000
end
K = args.K;
nIter = args.nIter;

% generate W, H
W = generateFullrankMatrix(size(X, 1), K);
H = generateFullrankMatrix(K, size(X, 2));

% update W, H
for i = nIter
    W = W .* (X * H') ./ (W * (H * H'));
    H = H .* (W' * X) ./ ((W' * W) * H);
end

% calculate WH
WH = W * H;
end

%% Local function
%--------------------------------------------------------------------------
function fullrankMatrix = generateFullrankMatrix(row, column)
fullrankMatrix = zeros(row, column);
while rank(fullrankMatrix) < min(row, column)
    fullrankMatrix = rand(row, column);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%