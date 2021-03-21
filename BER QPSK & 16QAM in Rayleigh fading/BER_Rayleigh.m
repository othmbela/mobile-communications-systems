% Plot the theoretical error probability for QPSK and 16QAM in Rayleigh
% fading.
%
% Othmane Belarbi
%% -------------------------------- Clear ---------------------------------

clear;       % clear all variables in the workspace
close all;   % close all open figures
clc;         % clear command window

%% -------------------- Theoretical Error Probability ---------------------

EbNo = (0:40)';

% Compute the theoretical BER of the QPSK & 16QAM in Raileigh Fading
QPSK_BER_RAY = berfading(EbNo, 'psk', 4, 1);
QAM_16_BER_RAY = berfading(EbNo, 'qam', 16, 1);

QPSK_BER   = berawgn(EbNo, 'psk', 4, 'nondiff');
QAM_16_BER = berawgn(EbNo, 'qam', 16);

%% -------------------------------- Plots ---------------------------------

figure(1)
semilogy(EbNo, QPSK_BER_RAY, 'b', EbNo, QPSK_BER, 'b--')

hold on
semilogy(EbNo, QAM_16_BER_RAY, 'r', EbNo, QAM_16_BER, 'r--')
hold off

ylim([1e-8 1])
xlabel('Eb/No [dB]')
ylabel('BER')
legend('QPSK in Rayleigh Fading', 'QPSK in AWGN', '16-QAM in Rayleigh Fading', '16-QAM in AWGN')
title('Theoretical Error Probability in Rayleigh Fading')
grid on
