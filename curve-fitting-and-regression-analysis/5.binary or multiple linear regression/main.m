% 二元线性回归（多元可以类比，但无法画二维平面）
% 当有某些变量的取值始终不变时，其系数一定为0(可推导)
clear,clc
close all
data = xlsread('data.xlsx');
x1 = data(:, 1);   % 自变量1（列向量）
x2 = data(:, 2);   % 自变量2（列向量）
Y = data(:, 3);    % 因变量（列向量）

X = [x1, x2, ones(size(Y))];               
[b, bint, r] = regress(Y, X);
fprintf('regression coefficient：')
fprintf('a=%.4f, b=%.4f, c=%.4f\n', b(1), b(2), b(3))
fprintf('95%% confidence interval: ')
fprintf('[%.4f, %.4f], [%.4f, %.4f], [%.4f, %.4f]\n',...
    bint(1,1), bint(1,2), bint(2,1), bint(2,2), bint(3,1), bint(3,2))

%% 计算拟合度
S = sum((Y-mean(Y)).^2);
A = sum(r.^2);
R = 1-A/S;   
fprintf('R-squared: %.4f\n', R)

%% 绘制残差图和qq图
figure('name','Residual Plot')
stem(r, 'k');
grid
title('Residual Plot')
axis tight
figure('name', 'QQ-plot')
qqplot(r)
title('QQ Plot')
axis tight

%% 绘制回归图
figure('name', 'Regression Plot')
colormap('jet')
scatter3(x1, x2, Y, 20, Y, 'filled')
hold on
x1fit = linspace(min(x1), max(x1), 20); % x1fit = min(x1):0.1:max(x1);
x2fit = linspace(min(x2), max(x2), 20); % x2fit = min(x2):0.2:max(x2);
[X1FIT, X2FIT] = meshgrid(x1fit, x2fit);
YFIT = b(1)*X1FIT + b(2)*X2FIT + b(3);
mesh(X1FIT, X2FIT, YFIT)
xlabel('')
ylabel('')
zlabel('')
title('Regression Plot')