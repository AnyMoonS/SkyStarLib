function m=myf(myI,p,q)%�Ӻ���,�������
global x_average y_average
[y,x]=size(myI);m00=sum(sum(myI));
m=0;
for i=1:y
    for j=1:x
        m=m+(i-y_average)^q*(j-x_average)^p*myI(i,j);%���
    end
end
m=m/m00^((p+q)/2+1);%��һ��