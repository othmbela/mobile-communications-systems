% DEMODULATEQPSK  Demodulate using the quadrature phase shift keying method.
%
% Example:
%   rxBits = demodulateQPSK(rxSig, K, mGray, mComplex)
%
% Inputs:
%   rxSig    : The input that we want to demodulate.
%   K        : The length of rxSig.
%   mGray    : The Gray matrix with codes in decimal.
%   mComplex : The matrix with the complex symbol.
%
% Output:
%   rxBits   : The signal demodulated using QPSK method.

function rxBits = demodulateQPSK(rxSig, K, mGray, mComplex)

    signalCorrected = zeros(1, K/2);
    rxBits          = '';
    
    for i=1:length(rxSig)
        % Take the sign of the real and imaginary part of the symbol
        signalCorrected(i) = sign(real(rxSig(i))) + 1i*sign(imag(rxSig(i)));
        
        % Find the binary representation of the symbol
        [x, y]             = find(mComplex == signalCorrected(i));
        bits               = dec2bin(mGray(x,y), 2);
        
        % Store the binary representation into rxBits
        rxBits             = strcat(rxBits, bits);
    end
    
    % Convert the string into an array of numerical value
    rxBits = str2num(char(num2cell(rxBits)))';
    
end
