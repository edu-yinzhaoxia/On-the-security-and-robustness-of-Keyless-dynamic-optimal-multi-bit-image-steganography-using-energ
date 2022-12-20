clc;
clear;

a=zeros(3,3);
a(2,3)=1;
a(3,3)=3;
size(a)
b=reshape(a,1,1*9)
[value,index]=sort(b,'DESCEND')%能量的降序排列

                 
                
                