A = [0 1 0 0;
    0 -0.1 3 0;
    0 0 0 1;
    0 -0.5 30 0] %A — State matrix

B = [0; 2; 0; 5] % B — Input-to-state matrix

Q = [1 0 0 0;
    0 0 0 0;
    0 0 1 0;
    0 0 0 0] %use Bryson's rule to determine Q and R. Q — State-cost weighted matrix

R = 1        %R — Input-cost weighted matrix

N = [0; 0; 0;0]      %  Find the gain matrix K using lqr. Since N is not specified, lqr sets N to 0. N — Optional cross term matrix



[K S P] = lqr(A,B,Q,R,N)  %[K,S,P] = lqr(A,B,Q,R,N) %calculates the optimal gain matrix K, the solution S of the associated algebraic Riccati equation and the closed-loop poles P using the continuous-time state-space matrices A and B. 
%This syntax is only valid for continuous-time models.
%P — Poles of the closed-loop system
%S — Solution of the associated algebraic Riccati equation
%K — Optimal gain

C = [0 0 0 1];

D = 0


sys = ss(A-B*K,B,C,D); %sys — Dynamic system model
step(sys)






