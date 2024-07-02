clear;clc;
Sample1=[1 1; 2 0; 2 1; 0 2; 1 3;2 2;3 5; -1 3; -2 4; -1 4;];
Sample2=[-1 2; 0 0; -1 0; -1 -1; 0 -2; -1 -2; -1 1; -2 0; 2 -2; -3 1;];
hold on
plot(Sample1(:,1),Sample1(:,2),'ro')
plot(Sample2(:,1),Sample2(:,2),'b*')
legend('类别 1','类别 2');
W=Perceptron_Training(Sample1,Sample2)
x=[-10:10];
y=(-W(1)*x-W(3))/W(2);
plot(x,y);
axis([-10 10 -10 10]);