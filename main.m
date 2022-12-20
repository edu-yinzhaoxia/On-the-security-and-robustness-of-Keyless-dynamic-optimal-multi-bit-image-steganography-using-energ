clc;
clear;

Delta=4;
stego_path='F:\LSB\LSB_1\rubost\payload\4_0.1.bmp';
L=ceil(256*256*0.5);
if mod(L,8-Delta)~=0
    L=ceil(L/(8-Delta))*(8-Delta);
else 
    L=L;
end
[M]=extract(stego_path,Delta,L);
stego_path_stir='F:\LSB\LSB_1\rubost\攻击结果\N=1\新建文件夹\4_1_0.2_NOISE_20.bmp';
[N]=extract(stego_path_stir,Delta,L);

error=sum(M~=uint8(N))/L%验证信息是否正确嵌入