% Perform a baseband simulation of a QPSK communication system in AWGN.
%
% Othmane Belarbi
%% -------------------------------- Clear ---------------------------------

clear;                      % clear all variables in the workspace
close all;                  % close all open figures
clc;                        % clear command window

%% ------------------------------ Parameters ------------------------------
 
K      = 2^9;               % Number of bits
SNRdB  = 0:12;              % SNR in dB
SNR    = 10.^(SNRdB/10);    % SNR in decimal

%% ------------------------------ Compute BER -----------------------------

% Compute theoretical QPSK Bit Error Rate
Theoretical_QPSK_BER = berawgn(SNRdB, 'psk', 4, 'nondiff');

% Compute practical QPSK Bit Error Rate using Monte Carlo Simulation
[mComplex, mGray]  = matrixParameters();
Practical_QPSK_BER = zeros(1, length(SNRdB));

for I = 1:length(SNRdB)
    error = 0;
    for J = 1:K
        [BER, ~, ~, ~, ~]     = simulate(K, mGray, mComplex, SNR(I));
        Practical_QPSK_BER(I) = Practical_QPSK_BER(I) + BER;
    end
    Practical_QPSK_BER(I) = Practical_QPSK_BER(I) / K;
end

%% --------------------------------- Plot ---------------------------------

figure(1)
semilogy(SNRdB, Practical_QPSK_BER, '-o', SNRdB, Theoretical_QPSK_BER, '--')
axis([0 12  10e-9 1])
xlabel('Eb/No [dB]')
ylabel('BER')
legend('Simulation', 'Theoretical')
title('BER in AWGN for different Eb/No values')
grid on
