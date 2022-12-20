%信息提取
%已知信息的长度、嵌入方法，以及每个像素的嵌入长度8-Delta
function [N]=extract(stego_path,Delta,L)
stego=imread(stego_path);
[c,l]=size(stego);
num=ceil(L/(8-Delta));
E1=energy(stego,Delta);
E1=reshape(E1,1,c*l);
[value1,index1]=sort(E1,'DESCEND');
[N]=read(stego,Delta,L,num,index1);

