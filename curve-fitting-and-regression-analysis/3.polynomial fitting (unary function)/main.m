%多项式拟合（一元）
clc
clear
close all
data=xlsread('data.xlsx','A2:B24');
x = data(:,1);                          %自变量（列向量）
y = data(:,2);                          %因变量（列向量）

n = length(y);
step = 1997:2022;                           %预测的X轴

[p,S] = polyfit(x,y,2);
%[y, delta] = polyconf(p,step,S,0.05);      %默认0.05 
[yfit, delta] = polyval(p,step,S);         %计算误差delta需要S
%yfit = polyval(p,step);
plot(data(:,1),data(:,2),'r*',step,yfit,'--b')
title('散点图及回归曲线');

MEAN=mean(y);
S = sum((y-MEAN).^2);
A = sum((yfit(1:n)'-y).^2);
R = 1-A/S;    %R为拟合度
fprintf('拟合度R方：%f\n',R);

zhiXinQuJian = zeros(length(yfit),2);
zhiXinQuJian(:,1) = yfit-delta;
zhiXinQuJian(:,2) = yfit+delta;
%% 拟合误差
res = y-yfit(1:n)';        