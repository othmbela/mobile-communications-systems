% Plots the capacity curves vs SNR for the cases when n_t = n_r = 6, 12, 24
%
% Othmane Belarbi
%% -------------------------------- Clear ---------------------------------

clear;                      % clear all variables in the workspace
close all;                  % close all open figures
clc;                        % clear command window

%% ------------------------------ Parameters ------------------------------

SNRdB = 0:1:25;
SNR   = 10.^(SNRdB/10);

Ant   = [6, 12, 24];
repet = 1e4;

%% ------------------------------- Capacity -------------------------------

Cawgn            = log2(1 + SNR);
Capacity_Normal  = zeros(length(Ant), length(SNR));
Capacity_Unitary = zeros(length(Ant), length(SNR));

for I = 1:length(SNR)
    CC_Normal = zeros(length(Ant), 1);
    CC_Unitary = zeros(length(Ant), 1);
    
    for J = 1:repet
        HH = (randn(24) + 1i * randn(24)) / sqrt(2);
        
        for K = 1:length(Ant)
            H  = HH(1:Ant(K), 1:Ant(K));
            
            CC_Normal(K) = CC_Normal(K) + log2( real(det(Id + SNR(I)*(H*H') / Ant(K) )));
            CC_Unitary(K) = CC_Unitary(K) + Ant(K) * log2( 1 + SNR(I));
        end
    end
    
    Capacity_Normal(:, I)  = CC_Normal  / repet;
    Capacity_Unitary(:, I) = CC_Unitary / repet;
end

%% -------------------------------- Plots ---------------------------------

figure(1);
subplot(1,2,1);
plot(SNRdB, Cawgn, SNRdB, Capacity_Normal(1, :), SNRdB, Capacity_Normal(2, :), SNRdB, Capacity_Normal(3, :));
legend("AWGN", "6x6", "12x12", "24x24", 'Location','northwest');
ylim([0 200]);
xlabel("SNR [dB]");
ylabel("Ergodic Capacity [bits/sec/Hz]");
title("Capacity vs SNR where channels are complex circular symmetric Gaussian");

subplot(1,2,2);
plot(SNRdB, Cawgn, SNRdB, Capacity_Unitary(1, :), SNRdB, Capacity_Unitary(2, :), SNRdB, Capacity_Unitary(3, :));
legend("AWGN", "6x6", "12x12", "24x24", 'Location','northwest');
ylim([0 200]);
xlabel("SNR [dB]");
ylabel("Ergodic Capacity [bits/sec/Hz]");
title("Capacity vs SNR where channels are all unitary");
