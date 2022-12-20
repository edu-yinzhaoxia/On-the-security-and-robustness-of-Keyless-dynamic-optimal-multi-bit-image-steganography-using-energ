function [N]=read(stego,Delta,L,num,index1)
[c,l]=size(stego);
N=zeros(1,L);
for i =1:num
    if mod(index1(i),c)~=0
        [bin]=BinaryConversion_10_2(stego(mod(index1(i),c),floor(index1(i)/c)+1));
        N((8-Delta)*(i-1)+1:(8-Delta)*i)=bin(Delta+1:8);        
    else
        [bin]=BinaryConversion_10_2(stego(c,floor(index1(i)/c)));   
        N((8-Delta)*(i-1)+1:(8-Delta)*i)=bin(Delta+1:8);
        
    end
    
end