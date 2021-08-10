% �Զ��庯����ϣ�һԪ��
clear
clc
close all
data = xlsread('data.xlsx', 'A3:B131');
%% ���
x = data(:, 1);      % �Ա�������������ʽ��
y = data(:, 2);      
n = sum(y);
y = y/n;             % ���������������ʽ��

f = fittype('1/(sigma*sqrt(2*pi))*exp(-(x1-miu).^2./(2*sigma^2))', 'independent',...
    'x1', 'dependent', 'y1', 'coefficients', {'sigma', 'miu'}); 
opts = fitoptions(f);
opts.Display = 'Off';
%opts.Lower = [0 0];
opts.StartPoint = [95 5];      % ��ϲ�������㣬���ܻ�Ӱ����
cfun = fit(x, y, f, opts)      % �����Զ�����Ϻ���f���������x��y���õ���Ϻ���cfun
step = min(x)-10 : max(x)+10;

%% ��ͼ
figure
plot(x, y, 'bo', 'MarkerSize', 8, 'LineWidth', 1.5)
hold on
plot(step, cfun(step), 'k-', 'MarkerSize', 8, 'LineWidth', 2);
xlabel('�˿�����ʱ��(��λ����)')
ylabel('Ƶ��')