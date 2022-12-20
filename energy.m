function [E]=energy(img,Delta)
[r,c] = size(img);
T = zeros(r,c);%用于保存能量计算位的十进制数
E = zeros(r,c);%用于保存计算的能量
for i=1:r
    for j=1:c
        value = img(i,j); %当前位置的像素值
        [bin] = BinaryConversion_10_2(value); %将像素值value转换成8位二进制数,并将前Delta位转换位10进制返回
        for t=1:Delta
           T(i,j) = T(i,j) + bin(t)*(2^(Delta-t));
        end

    end%得到可以计算能量的矩阵
end
%图像最边缘像素不计算能量
for i=2:r-1
    for j=2:c-1
        E(i,j)=abs(T(i,j)-T(i-1,j-1))+abs(T(i,j)-T(i-1,j))+abs(T(i,j)-T(i,j-1))+abs(T(i,j)-T(i-1,j+1))+...
            abs(T(i,j)-T(i,j+1))+abs(T(i,j)-T(i+1,j+1))+abs(T(i,j)-T(i+1,j))+abs(T(i,j)-T(i+1,j-1));
    end
end









    
    
    

