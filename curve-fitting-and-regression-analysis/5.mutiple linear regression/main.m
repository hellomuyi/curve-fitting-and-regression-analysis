%二元线性回归，多元可以类比
%当有某些变量的取值始终不变时，其系数一定为0(可推导)
clear,clc
close all
data = xlsread('data.xlsx');
x1 = data(:,1);   %自变量1（列向量）
x2 = data(:,2);   %自变量2（列向量）
Y = data(:,3);    %因变量（列向量）
X = [x1,x2,ones(size(Y))];               %整合自变量，ones对应常数项
[b,~,R] = regress(Y,X);
%%
figure('name','残差图')
stem(R,'k');
title('误差图')
%%
fitY = X*b;
figure('name','回归图')
plot3(x1,x2,Y,'r*')
hold on
plot3(x1,x2,fitY,'b-','linewidth',2)
hold off