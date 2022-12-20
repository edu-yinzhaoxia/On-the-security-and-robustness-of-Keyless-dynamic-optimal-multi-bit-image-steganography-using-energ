function [E]=energy(img,Delta)
[r,c] = size(img);
T = zeros(r,c);%���ڱ�����������λ��ʮ������
E = zeros(r,c);%���ڱ�����������
for i=1:r
    for j=1:c
        value = img(i,j); %��ǰλ�õ�����ֵ
        [bin] = BinaryConversion_10_2(value); %������ֵvalueת����8λ��������,����ǰDeltaλת��λ10���Ʒ���
        for t=1:Delta
           T(i,j) = T(i,j) + bin(t)*(2^(Delta-t));
        end

    end%�õ����Լ��������ľ���
end
%ͼ�����Ե���ز���������
for i=2:r-1
    for j=2:c-1
        E(i,j)=abs(T(i,j)-T(i-1,j-1))+abs(T(i,j)-T(i-1,j))+abs(T(i,j)-T(i,j-1))+abs(T(i,j)-T(i-1,j+1))+...
            abs(T(i,j)-T(i,j+1))+abs(T(i,j)-T(i+1,j+1))+abs(T(i,j)-T(i+1,j))+abs(T(i,j)-T(i+1,j-1));
    end
end









    
    
    

