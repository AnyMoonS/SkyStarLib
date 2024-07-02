function W=Training(Sample1,Sample2);
[N1,l]=size(Sample1);
[N2,l]=size(Sample2);
W=zeros(l+1,1);
S1=ones(l+1,N1);
S1(1:2,:)=Sample1';
S2=ones(l+1,N2);
S2(1:2,:)=Sample2';
k=0;
r=1.5
J=1;
while (J>0&k<100)
k=k+1
dJ=zeros(l+1,1);
Nerror=0;
for i=1:N1
if W'*S1(:,i)<=0
dJ=dJ-S1(:,i);
Nerror=Nerror+1;
end
end
for i=1:N2
if W'*S2(:,i)>=0
dJ=dJ+S2(:,i);
Nerror=Nerror+1;
end
end
if Nerror>0
W=W-r*dJ
else
J=0;
end
Nerror
J
end