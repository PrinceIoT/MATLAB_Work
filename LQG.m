A = [1.1269   -0.4940    0.1129 
     1.0000         0         0 
          0    1.0000         0];

B = [-0.3832
      0.5919
      0.5191];

C = [1 0 0];

D = 0;

Q = 1;
R=1;
N=0

Plant = ss(A,B,C,D,-1); %Assume that the plant has the following state-space 
                        %matrices and is a discrete-time plant with an unspecified sample time (Ts = -1)
Plant.InputName = 'un';
Plant.OutputName = 'yt';

Sum = sumblk('un = u + w');
sys = connect(Plant,Sum,{'u','w'},'yt');

[kalmf,L,P] = kalman(sys,Q,R,N);
size(kalmf)

kalmf.InputName
kalmf.OutputName
L