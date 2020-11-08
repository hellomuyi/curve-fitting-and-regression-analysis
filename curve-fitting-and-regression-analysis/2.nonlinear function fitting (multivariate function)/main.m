clear
clc
close all
data = xlsread('data.xlsx');
%%
Y = log10(data(:,1));
X = data(:,2:5);
beta0 = rand(1,5);                    %拟合的初始点
%法一
[beta, error] = nlinfit(X,Y,'myFun',beta0);%beta为拟合结果
disp(beta')
Yhat = myFun(beta,X);   %拟合值

%{
%法二
mdl = fitnlm(X,Y,@myFun,beta0)
beta = mdl.Coefficients(:,1);
beta = table2array(beta);
Yhat = myFun(beta,X);   %拟合值
%}