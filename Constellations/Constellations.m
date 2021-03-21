%% -------------------------------- Clear ---------------------------------

clear;                      % clear all variables in the workspace
close all;                  % close all open figures
clc;                        % clear command window

%% ------------------------------ Parameters ------------------------------

x=0:0.1:2*pi;
y=0:0.1:2*pi;

QPSK = -3*pi/4:2*pi/4:3*pi/4;
PSK8 = -7*pi/8:2*pi/8:7*pi/8;
PSK16 = -15*pi/16:2*pi/16:15*pi/16;
QAM16 = -3:2:3;

%% ------------------------------ Modulations -----------------------------

modulationQPSK = cos(QPSK) + 1i * sin(QPSK);
modulation8PSK = cos(PSK8) + 1i * sin(PSK8);
modulation16PSK = cos(PSK16) + 1i * sin(PSK16);
modulation16QAM = [1+1i    1-1i    -1+1i   -1-1i
                   3+1i    3-1i    -3+1i   -3-1i
                   -1+3*1i -1-3*1i 1+3*1i  1-3*1i
                   3+3*1i  3-3*1i  -3+3*1i -3-3*1i];

%% -------------------------------- Plots ---------------------------------

figure(1)
subplot(1, 2, 1)
plot(cos(x), sin(y), 'k--');
hold on 
plot(modulationQPSK, 'rx', 'LineWidth',2, 'MarkerSize',10);
hold off
axis([-2 2 -2 2]);
xlabel('In-phase Amplitude', 'FontSize', 12)
ylabel('Quadrature Amplitude', 'FontSize', 12)
title('Constellation QPSK', 'FontSize', 13)
line([0,0], ylim, 'Color', 'k', 'LineWidth', 1.5);
line(xlim, [0,0], 'Color', 'k', 'LineWidth', 1.5);
grid on

subplot(1, 2, 2)
plot(cos(x), sin(y), 'k--');
hold on 
plot(modulation8PSK, 'rx', 'LineWidth',2, 'MarkerSize',10);
hold off
axis([-2 2 -2 2]);
xlabel('In-phase Amplitude', 'FontSize', 12)
ylabel('Quadrature Amplitude', 'FontSize', 12)
title('Constellation 8PSK', 'FontSize', 13)
line([0,0], ylim, 'Color', 'k', 'LineWidth', 1.5);
line(xlim, [0,0], 'Color', 'k', 'LineWidth', 1.5);
grid on

figure(2)
subplot(1, 2, 1)
plot(cos(x), sin(y), 'k--');
hold on
plot(modulation16PSK, 'rx', 'LineWidth',2, 'MarkerSize',10);
hold off
axis([-2 2 -2 2]);
xlabel('In-phase Amplitude', 'FontSize', 12)
ylabel('Quadrature Amplitude', 'FontSize', 12)
title('Constellation 16PSK', 'FontSize', 13)
line([0,0], ylim, 'Color', 'k', 'LineWidth', 1.5);
line(xlim, [0,0], 'Color', 'k', 'LineWidth', 1.5);
grid on

subplot(1, 2, 2)
plot(modulation16QAM, 'rx', 'LineWidth',2, 'MarkerSize',10);
axis([-4 4 -4 4]);
xlabel('In-phase Amplitude', 'FontSize', 12)
ylabel('Quadrature Amplitude', 'FontSize', 12)
title('Constellation 16QAM', 'FontSize', 13)
line([0,0], ylim, 'Color', 'k', 'LineWidth', 1.5);
line(xlim, [0,0], 'Color', 'k', 'LineWidth', 1.5);
grid on