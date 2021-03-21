% Plot the theoretical error probability for QPSK and 16QAM in Rayleigh
% fading with diversity orders of 2 and 4.
%
% Othmane Belarbi
%% -------------------------------- Clear ---------------------------------

clear;       % clear all variables in the workspace
close all;   % close all open figures
clc;         % clear command window

%% -------------------- Theoretical Error Probability ---------------------

EbNo = (0:40)';

% Compute the theoretical BER of the QPSK & 16QAM in Raileigh Fading
% with different order.
QPSK_BER_RAY = berfading(EbNo, 'psk', 4, 1);
QAM_16_BER_RAY = berfading(EbNo, 'qam', 16, 1);

QPSK_BER_RAY_order2 = berfading(EbNo, 'psk', 4, 2);
QAM_16_BER_RAY_order2 = berfading(EbNo, 'qam', 16, 2);

QPSK_BER_RAY_order4 = berfading(EbNo, 'psk', 4, 4);
QAM_16_BER_RAY_order4 = berfading(EbNo, 'qam', 16, 4);

%% -------------------------------- Plots ---------------------------------

figure(1)
semilogy(EbNo, QPSK_BER_RAY, 'r', EbNo, QPSK_BER_RAY_order2, '-or', EbNo, QPSK_BER_RAY_order4, '--r')
text(28.5, 1e-4, sprintf('L=%d',1))
text(28.5, 1e-7, sprintf('L=%d',2))
text(28.5, 1e-11, sprintf('L=%d',4))

hold on
semilogy(EbNo, QAM_16_BER_RAY, 'b', EbNo, QAM_16_BER_RAY_order2, '-ob', EbNo, QAM_16_BER_RAY_order4, '--b')
hold off

xlabel('Eb/No [dB]')
ylabel('BER')
legend('QPSK — order = 1', 'QPSK — order = 2', 'QPSK — order = 4', '16-QAM — order = 1', '16-QAM — order = 2', '16-QAM — order = 4')
title('Theoretical Error Probability in Rayleigh Fading with diversity order 1, 2 & 4')
grid on