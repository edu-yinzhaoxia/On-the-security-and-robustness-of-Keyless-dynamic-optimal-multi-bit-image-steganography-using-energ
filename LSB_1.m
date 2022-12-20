%LSB
%��������
clc;
clear;
pgms = dir('F:\Dataset\experiment\boss_256_cover\*.pgm');
num_pgms = length( pgms );

for i =1:num_pgms
    file_path = fullfile( 'F:\Dataset\experiment\boss_256_cover\' ,pgms(i).name );
    Delta=4;%��������λ��
    L=ceil(256*256*0.5);
    if mod(L,8-Delta)~=0 %��֤��Ϣ����������Ƕ�뵽������������
        L=ceil(L/(8-Delta))*(8-Delta);
    else 
        L=L;
    end   
    img_color=uint8(imread(file_path));
    img=img_color(:,:,1);
    
    E=energy(img,Delta);%�������
    M=uint8(randi([0 1],1,round(L))<0.5);%��Ϣ
    num=ceil(L/(8-Delta));%Ƕ��������
    [c,l]=size(img);
    E=reshape(E,1,c*l);
    [value,index]=sort(E,'DESCEND');%�����Ľ�������
    
    [stego]=replace(img,M,Delta,num,index);%��Ϣ��Ƕ��
    stego=uint8(stego);%����ͼ��
    [ path , name , ext ] = fileparts( file_path ) ;
    filename = strcat( name , '.pgm' );
    bmp_file = fullfile( 'F:\LSB\LSB_1\modify\security\n4_0.5\' , filename ) ;
    imwrite(stego,bmp_file);
    stego_path_stir=bmp_file;
    [N]=extract(stego_path_stir,Delta,L);%��ȡ��֤
    i
    error=sum(M~=uint8(N))
end







