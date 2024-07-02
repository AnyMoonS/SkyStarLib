function [bw1] = classify(x1,x2,w,bw); %分类函数
kw=w(2)/w(1);
cita=atan(kw);
if w(1)<0
cita=pi+cita;
end
pjpoint1=[];
pjpoint2=[];
for i=1:10
p1=projectline([x1(i,1) x1(i,2)],w,bw);
pjpoint1=[pjpoint1,p1];
p2=projectline([x2(i,1) x2(i,2)],w,bw);
pjpoint2=[pjpoint2,p2];
end
pjpoint=[pjpoint1,pjpoint2];
bw1=mean(pjpoint);%原始数据降到一维数据时的分类点
bw1=bw1/sin(cita)+bw;%计算分类线在y轴上的截距
%============投影函数===================
function p = projectline(point,w,bw);
kw=w(2)/w(1);
%对原始数据在直线y=kw*x上进行投影
x=(point(1)+kw*point(2)-kw*bw)/(1+kw^2);
y=kw*x+bw;
p=sqrt(x^2+(y-bw)^2);
if w(1)>0
   if x<0
p=-p;
   end
else
   if x>0
p=-p;
   end
end