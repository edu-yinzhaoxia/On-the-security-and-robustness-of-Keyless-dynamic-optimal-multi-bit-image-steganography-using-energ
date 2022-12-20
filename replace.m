function [stego]=replace(img,M,Delta,num,index)
[c,l]=size(img);
%将前num个高能量像素用于嵌入秘密信息
for i =1:num
    stego_b=0;
    if mod(index(i),c)~=0 %通过索引确定高能量像素位置
        [bin]=BinaryConversion_10_2(img(mod(index(i),c),floor(index(i)/c)+1));
        bin(Delta+1:8)=M((i-1)*(8-Delta)+1:i*(8-Delta));
        leng = length(bin(:));
        for t=1:leng
           stego_b = stego_b + bin(t)*(2^(leng-t));
        end
        img(mod(index(i),c),floor(index(i)/c)+1)=stego_b;
    else
        [bin]=BinaryConversion_10_2(img(c,floor(index(i)/c)));    %img2(512,floor(index(i)/c))=value(i);
        bin(Delta+1:8)=M((i-1)*(8-Delta)+1:i*(8-Delta));
        leng = length(bin(:));
        for t=1:leng
           stego_b = stego_b + bin(t)*(2^(leng-t));%有没有bin2dec函数
        end
        img(c,floor(index(i)/c))=stego_b;
    end

stego=img;
end