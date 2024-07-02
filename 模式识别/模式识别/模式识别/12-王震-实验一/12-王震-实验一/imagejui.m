function y=imagejui(bw)%图像的不变矩
global x_average y_average
myI=double(bw);[y,x]=size(myI);
m00=sum(sum(myI));m10=0;m01=0;
for i=1:y
    for j=1:x
        m10=m10+j*myI(i,j); m01=m01+i*myI(i,j);%求一阶矩
    end
end
x_average=m10/m00;y_average=m01/m00;
m20=myf(myI,2,0);m02=myf(myI,0,2);
m11=myf(myI,1,1);
m30=myf(myI,3,0);m03=myf(myI,0,3);
m12=myf(myI,1,2);m21=myf(myI,2,1);
m1=m20+m02;%按定义求七个不变矩
m2=(m20-m02)^2+4*m11^2;
m3=(m30-3*m12)^2+(3*m21-m03)^2;
m4=(m30+m12)^2+(m21+m03)^2;
m5=(m30-3*m12)*(m30+m12)*((m30+m12)^2-3*(m12+m03)^2)+(m03-3*m21)*(m03+m12)*((m03+m21)^2-3*(m12+m03)^2);
m6=(m20-m02)*((m30+m12)^2-(m21+m03)^2)+4*m11*(m30+m12)*(m03+m21);
m7=(3*m21-m03)*(m30+m12)*((m30+m12)^2-3*(m21+m03)^2)+(m30-3*m12)*(m03+m21)*((3*m30+m12)^2-(m21+m03)^2);
y=[m1;m2;m3;m4;m5;m6;m7];
y=abs(log10(abs(y)));%利用对数的方法进行数据压缩，并给出正值



