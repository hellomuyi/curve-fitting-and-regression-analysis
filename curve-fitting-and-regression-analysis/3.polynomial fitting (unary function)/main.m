clear
clc
close all
data = xlsread('data.xlsx');
x = data(:, 1);
y = data(:, 2);

%%
[p, S] = polyfit(x, y, 2); 
fprintf('拟合方程: y = %.4fx^2 + %.4fx + %.4f\n', p(1), p(2), p(3));
% 计算R方
T = sum((y-mean(y)).^2);
A = sum((polyconf(p, x, S)-y).^2);
R = 1 - A/T;   
fprintf('拟合度R方：%f\n', R);
step = min(x):0.005:max(x);
% 由拟合的方程预测
[y_fit,delta] = polyconf(p, step, S, 1-0.628); % 1-0.628为置信度，默认为0.05
% [y, delta] = polyconf(p,step,S,0.05);      % 默认0.05 
% [yfit, delta] = polyval(p,step,S);         % 计算误差delta需要S
% yfit = polyval(p, step);

%%
figure(1)
scatter(x, y, 10, 'b', 'filled');
hold on
plot(step, y_fit, 'r-', 'linewidth', 2)
hold off
axis([0.9 1 0 600])
set(gca,'xtick',0.9:0.01:1) 
xlabel('小型车占比')
ylabel('5分钟车流量(veh/5min)')

%%
figure(2)
h1 = scatter(x, y, 10 , 'b', 'filled');
hold on
h2 = plot(step, y_fit, 'r-', 'linewidth', 2);
hold on
h3 = plot(step, y_fit-delta, 'y-', 'linewidth', 2);    % 置信下界
hold on
plot(step, y_fit+delta, 'y-', 'linewidth', 2)          % 置信上界
hold off
axis([0.9 1 0 600])
set(gca,'xtick',0.9:0.01:1) 
grid
xlabel('小型车占比')
ylabel('5分钟车流量(veh/5min)')
legend([h1, h2, h3], 'Data', 'Poly Fit', '62.8% Prediction Interval', 'Location', 'NorthWest')