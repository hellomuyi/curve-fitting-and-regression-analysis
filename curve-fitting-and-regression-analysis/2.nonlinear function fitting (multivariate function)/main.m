clear
clc
close all
data = xlsread('data.xlsx');
%%
Y = log10(data(:, 1));
X = data(:, 2:5);
beta0 = rand(1, 5);                    %��ϵĳ�ʼ��

%��һ
[beta, error] = nlinfit(X, Y, 'myFun', beta0);  %betaΪ��Ͻ��
disp(beta')
Yhat = myFun(beta, X);          %���ֵ

%����
%{
mdl = fitnlm(X, Y, @myFun, beta0)
beta = mdl.Coefficients(:, 1);
beta = table2array(beta);
Yhat = myFun(beta, X);          %���ֵ
%}

MAE = mean(abs(error));         % ƽ���������
MXE = mean(abs(error)./abs(Y)); % ƽ��������