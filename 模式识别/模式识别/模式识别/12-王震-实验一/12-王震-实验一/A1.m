subplot(1,2,1);
imshow('C:\Users\86198\Desktop\12-����-ʵ��һ\lena.bmp')
title('lena.bmp');
subplot(1,2,2)
imshow('C:\Users\86198\Desktop\12-����-ʵ��һ\lena2.bmp')
title('lena2.bmp');
Im=dir('C:\Users\86198\Desktop\12-����-ʵ��һ\*.bmp');%��ȡ�ļ�����ȫ��ͼ��
N=length(Im);
I=cell(1,N);%��ʼ��cell���͵Ķ�ά����
p=cell(N,1);
for i=1:N
    I{1,i}=imread(strcat('C:\Users\86198\Desktop\12-����-ʵ��һ\',Im(i,1).name));%����ֵ, strcat�����ַ����ĺ���,��ȡ�Ķ���picture�ļ���ͼƬ
    I{1,i}=imbinarize(I{1,i});%ת��Ϊ��ֵͼ��
    P{i,1}=imagejui(I{1,i});
    feature=[P{i,1}]'%תzhi
end