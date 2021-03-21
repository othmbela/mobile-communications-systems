% MATRIXPARAMETERS  Return the mComplex and mGray matrix for the modulation and demodulation.
%
% Example:
%   [mComplex, mGray] = matrixParameters()
%
% Outputs:
%   mComplex   : The matrix with the complex symbol.
%   mGray      : The Gray matrix with codes in decimal.

function [mComplex, mGray] = matrixParameters()

    mComplex = [[1 + 1i -1 + 1i]
                [1 - 1i -1 - 1i]];

    mGray    = [[0  1]
                [2  3]];
            
end

