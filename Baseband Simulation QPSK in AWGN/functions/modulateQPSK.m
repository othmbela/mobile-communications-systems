% MODULATEQPSK  Modulate using the quadrature phase shift keying method.
%
% Example:
%   txSig = modulateQPSK(txBits, K, mGray, mComplex)
%
% Inputs:
%   txBits   : The binary input that we want to modulate.
%   K        : The length of txBits.
%   mGray    : The Gray matrix with codes in decimal.
%   mComplex : The matrix with the complex symbol.
%
% Output:
%   txSig    : The signal modulated using QPSK method.

function txSig = modulateQPSK(txBits, K, mGray, mComplex)
    
    txSig = zeros(1, K/2);
    index = 1;

    for i = 1:2:K
        % Map the binary input by 2bits
        mapping = bin2dec(strcat(int2str(txBits(i)), int2str(txBits(i+1))));
        
        % Find the symbol corresponding to the pair  of bits
        [x, y]   = find(mGray == mapping);
        
        % Store the symbol into txSig
        txSig(1, index) = mComplex(x, y);
        index = index + 1;
    end

end
