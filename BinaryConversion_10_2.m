function [bin] = BinaryConversion_10_2(value)
% ����˵������ʮ���ƻҶ�����ֵת����8λ����������
% ���룺value��ʮ���ƻҶ�����ֵ��
% �����bin2_8��8λ���������飩
bin = dec2bin(value)-'0';
if length(bin) < 8
    len = length(bin);
    B = bin;
    bin = zeros(1,8);
    for i=1:len
        bin(8-len+i) = B(i); %����8λǰ�油��0
    end 
    
end