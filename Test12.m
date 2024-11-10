clear
clc

y12=10-20i;
y13=10-30i;
y23=16-32i;

p2 = -2.566;
q2= -1.02i;
p3= -1.4;
q3=0.45i;

v1=1.05;
v2=1+0i;
v3=1+0i;

iter = 0;

for k=1:20
    v2=((p2-q2)/conj(v2)+y12*v1+y23*v3)/(y12+y23)
    v3=((p3-q3)/conj(v3)+y13*v1+y23*v2)/(y23+y13)
    display([iter v2 v3])
end