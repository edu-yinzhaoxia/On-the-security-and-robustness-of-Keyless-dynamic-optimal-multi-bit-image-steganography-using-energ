%LSB
%能量计算
clc;
clear;
pgms = dir('F:\Dataset\experiment\boss_256_cover\*.pgm');
num_pgms = length( pgms );

for i =1:num_pgms
    file_path = fullfile( 'F:\Dataset\experiment\boss_256_cover\' ,pgms(i).name );
    Delta=4;%能量计算位数
    L=ceil(256*256*0.5);
    if mod(L,8-Delta)~=0 %保证信息可以完整的嵌入到整数个像素中
        L=ceil(L/(8-Delta))*(8-Delta);
    else 
        L=L;
    end   
    img_color=uint8(imread(file_path));
    img=img_color(:,:,1);
    
    E=energy(img,Delta);%获得能量
    M=uint8(randi([0 1],1,round(L))<0.5);%信息
    num=ceil(L/(8-Delta));%嵌入像素数
    [c,l]=size(img);
    E=reshape(E,1,c*l);
    [value,index]=sort(E,'DESCEND');%能量的降序排列
    
    [stego]=replace(img,M,Delta,num,index);%信息的嵌入
    stego=uint8(stego);%载密图像
    [ path , name , ext ] = fileparts( file_path ) ;
    filename = strcat( name , '.pgm' );
    bmp_file = fullfile( 'F:\LSB\LSB_1\modify\security\n4_0.5\' , filename ) ;
    imwrite(stego,bmp_file);
    stego_path_stir=bmp_file;
    [N]=extract(stego_path_stir,Delta,L);%提取验证
    i
    error=sum(M~=uint8(N))
end







