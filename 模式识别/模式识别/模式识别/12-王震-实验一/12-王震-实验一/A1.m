subplot(1,2,1);
imshow('C:\Users\86198\Desktop\12-王震-实验一\lena.bmp')
title('lena.bmp');
subplot(1,2,2)
imshow('C:\Users\86198\Desktop\12-王震-实验一\lena2.bmp')
title('lena2.bmp');
Im=dir('C:\Users\86198\Desktop\12-王震-实验一\*.bmp');%读取文件夹中全部图像
N=length(Im);
I=cell(1,N);%初始化cell类型的二维矩阵
p=cell(N,1);
for i=1:N
    I{1,i}=imread(strcat('C:\Users\86198\Desktop\12-王震-实验一\',Im(i,1).name));%给Ⅰ赋值, strcat连接字符串的函数,存取的都是picture文件的图片
    I{1,i}=imbinarize(I{1,i});%转化为二值图像
    P{i,1}=imagejui(I{1,i});
    feature=[P{i,1}]'%转zhi
end