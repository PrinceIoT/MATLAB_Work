% Define constants
m = 1;           % mass of weight (kg)
g = 9.81;        % acceleration due to gravity (m/s^2)
B = 1.2;         % magnetic field (T)
A = 0.1;         % cross-sectional area of coil (m^2)
k = 100;         % spring constant (N/m)
R = 10;          % resistance of coil (ohms)
C = 1e-3;        % capacitance of circuit (F)
V0 = 10;         % initial voltage (V)
tspan = [0 10];  % time interval (s)

% Define initial conditions
x0 = 0;          % initial displacement (m)
v0 = 0;          % initial velocity (m/s)
q0 = 0;          % initial charge (C)
i0 = V0/R;       % initial current (A)

% Define equations of motion
f = @(t,x) [x(2); (-m*g + B^2*A*x(4)^2)/(m + k*x(1))];      % displacement and velocity
g = @(t,q) [q(2); -q(2)/(R*C)];                            % charge and current

% Solve equations of motion
options = odeset('RelTol',1e-6,'AbsTol',1e-9);   % set options for ODE solver
[t,x] = ode45(f, tspan, [x0 v0], options);      % solve displacement and velocity
[t,q] = ode45(g, tspan, [q0 i0], options);      % solve charge and current

% Plot results
figure;
subplot(3,1,1);
plot(t,x(:,1),'b');
title('Displacement vs Time');
xlabel('Time (s)');
ylabel('Displacement (m)');
subplot(3,1,2);
plot(t,q(:,2),'r');
title('Current vs Time');
xlabel('Time (s)');
ylabel('Current (A)');
subplot(3,1,3);
plot(t,q(:,1),'g');
title('Voltage vs Time');
xlabel('Time (s)');
ylabel('Voltage (V)');
