%自定义函数拟合（一元）
clear
clc
close all
data = xlsread('data.xlsx','A3:B131');
%% 拟合
x = data(:,1);      %自变量（列向量形式）
y = data(:,2);      
n = sum(y);
y = y/n;            %因变量（列向量形式）

f=fittype('1/(sigma*sqrt(2*pi))*exp(-(x1-miu).^2./(2*sigma^2))','independent','x1','dependent','y1','coefficients',{'sigma','miu'}); 
opts = fitoptions( f );
opts.Display = 'Off';
%opts.Lower = [0 0];
opts.StartPoint = [95 5];   %拟合参数的起点，可能会影响结果
cfun=fit(x,y,f,opts) %根据自定义拟合函数f来拟合数据x，y，得到拟合函数cfun
step=min(x)-10:max(x)+10;

%% 绘图
figure
plot(x,y,'bo','MarkerSize',8,'LineWidth',1.5)
hold on
plot(step,cfun(step),'k-','MarkerSize',8,'LineWidth',2);
xlabel('乘客走行时间(单位：秒)')
ylabel('频率')