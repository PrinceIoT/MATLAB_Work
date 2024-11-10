A = [0 1 0 0;
    0 -0.1 3 0;
    0 0 0 1;
    0 -0.5 30 0] %A — State matrix

B = [0; 2; 0; 5] % B — Input-to-state matrix

C = [1 0 0 0]

D = 0

Q = 1 %use Bryson's rule to determine Q and R. Q — State-cost weighted matrix

R = 1        %R — Input-cost weighted matrix

N = 0

[K S P] = lqr(A,B,Q,R,N); %Finding the state feedback gain K

sys = ss(A-B*K,B,C,D); %sys — Dynamic system model
step(sys);

[kest,L,P] = kalman(sys,Q,R,N); %Calcultaing the Kalman estimator, L-Kalman Gain

L,P
