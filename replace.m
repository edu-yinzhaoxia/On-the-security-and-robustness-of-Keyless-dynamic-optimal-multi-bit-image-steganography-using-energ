function [stego]=replace(img,M,Delta,num,index)
[c,l]=size(img);
%��ǰnum����������������Ƕ��������Ϣ
for i =1:num
    stego_b=0;
    if mod(index(i),c)~=0 %ͨ������ȷ������������λ��
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
           stego_b = stego_b + bin(t)*(2^(leng-t));%��û��bin2dec����
        end
        img(c,floor(index(i)/c))=stego_b;
    end

stego=img;
end