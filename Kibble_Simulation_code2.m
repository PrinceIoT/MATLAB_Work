% Define constants
h = 6.626e-34;      % Planck constant
g = 9.81;           % acceleration due to gravity
L = 1.5;            % length of balance arm (m)
m = 1;              % mass of weight (kg)
B = 1.2;            % magnetic field (T)
A = 0.1;            % cross-sectional area of coil (m^2)
r = 0.02;           % radius of coil (m)
k = 100;            % spring constant (N/m)
R = 10;             % resistance of coil (ohms)
C = 1e-3;           % capacitance of circuit (F)

% Define transfer function
s = tf('s');
H = (k/R) / (m*s^2 + (k/R)*s + k*m/(R*C));

% Define time vector and input
t = linspace(0, 10, 1000);
u = m*g*ones(size(t));

% Simulate response
y = lsim(H, u, t);

% Plot results
plot(t, y);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Kibble Balance Simulation');
