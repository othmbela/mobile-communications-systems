% Plot the theoretical error probability for BPSK, QPSK and 16QAM in AWGN
% for different Eb/No values.
%
% Othmane Belarbi
%% -------------------------------- Clear ---------------------------------

clear;       % clear all variables in the workspace
close all;   % close all open figures
clc;         % clear command window

%% -------------------- Theoretical Error Probability ---------------------

EbNo = (0:1:20)';

% Compute the Theoretical BER of the BPSK, QPSK & 16QAM in AWGN
BPSK_BER   = berawgn(EbNo, 'psk', 2, 'nondiff');
QPSK_BER   = berawgn(EbNo, 'psk', 4, 'nondiff');
QAM_16_BER = berawgn(EbNo, 'qam', 16);

%% -------------------------------- Plots ---------------------------------

figure(1)
semilogy(EbNo, BPSK_BER, '--o', EbNo, QPSK_BER, '--', EbNo, QAM_16_BER, '-')
xlabel('Eb/No [dB]')
ylabel('BER')
ylim([1e-8 1])
legend('BPSK','QPSK','16-QAM')
title('Theoretical Error Probability in AWGN for different Eb/No values')
grid on
