% һԪ���Իع�
clear,clc
close all
data = xlsread('data.xlsx');
x = data(:, 1);    % �Ա�������������
Y = data(:, 2);    % ���������������
X = [ones(size(Y)), x];             % �����Ա�����ones��Ӧ������
[b, ~, R] = regress(Y, X);
%%
figure('name', '�в�ͼ')
stem(R, 'k');
title('���ͼ')
%%
fitY = X * b;
figure('name', '�ع�ͼ')
plot(x, Y, 'r*')
hold on
plot(x, fitY, 'b-', 'linewidth', 2)
hold off