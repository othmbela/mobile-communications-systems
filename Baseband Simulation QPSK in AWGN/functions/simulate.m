% SIMULATE  Perform a baseband simulation of a QPSK modulation
% communication system in AWGN.
%
% Example:
%   [BER, txBits, txSig, rxBits, rxSig] = simulate(K, mGray, mComplex, SNR)
%
% Inputs:
%   K        : The length of txBits.
%   mGray    : The Gray matrix with codes in decimal.
%   mComplex : The matrix with the complex symbol.
%   SNR      : SNR (in decimal) at which you want to perform the baseband
%   simulation.
%
% Outputs:
%   mComplex   : The matrix with the complex symbol.
%   mGray      : The Gray matrix with codes in decimal.

function [BER, txBits, txSig, rxBits, rxSig] = simulate(K, mGray, mComplex, SNR)

    % Generete K bits normally distributed & Modulate using QPSK modulation scheme
    txBits = randi([0 1], 1, K);
    txSig  = modulateQPSK(txBits, K, mGray, mComplex);

    % AWGN Channel
    sigma = sqrt(1/(2*SNR));
    noise = sigma * (randn(1, K/2) + 1i*randn(1, K/2));
    rxSig = txSig + noise;
    
    % Demodulate the signal at the receiver
    rxBits = demodulateQPSK(rxSig, K, mGray, mComplex);

    % Compute the Bit Error Rate
    BER = length(find(rxBits - txBits ~= 0)) / K;
    
end
