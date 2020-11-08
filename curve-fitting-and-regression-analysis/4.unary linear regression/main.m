%一元线性回归
clear,clc
close all
data = xlsread('data.xlsx');
x = data(:,1);    %自变量（列向量）
Y = data(:,2);    %因变量（列向量）
X = [ones(size(Y)),x];                  %整合自变量，ones对应常数项
[b,~,R] = regress(Y,X);
%%
figure('name','残差图')
stem(R,'k');
title('误差图')
%%
fitY = X*b;
figure('name','回归图')
plot(x,Y,'r*')
hold on
plot(x,fitY,'b-','linewidth',2)
hold off