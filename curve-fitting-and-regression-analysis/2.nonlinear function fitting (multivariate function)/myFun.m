% beta: ��������
% X   : ��������һ��Ϊһ����Ԫ������ȡֵ
function y = myFun(beta, X)
y = beta(1)*X(:,2)+beta(2)*X(:,3)+beta(3)*X(:,4).^0.5+beta(4)*X(:,1).^beta(5);
end