% Define parameters
m = 1e-3; % mass of the test mass (kg)
n = 100; % number of turns in the coil
L = 0.1; % length of the coil (m)
B = 1.5; % magnetic field strength (T)
k = 31.7;

% Define variables
x = 0:0.0001:0.005; % range of test mass displacements to simulate
I_values = zeros(size(x)); % array to store calculated coil current values

% Calculate current
for i = 1:length(x)
    % Calculate gravitational force
    g = 9.81; % acceleration due to gravity (m/s^2)
    Fg = m * g;
    % Calculate displacement force
    Fd = -k * x(i);
    % Calculate net force
    F_net = Fg + Fd;
    % Calculate electromagnetic force
    I_values(i) = (B * L * F_net) / (n * h);
end

% Plot displacement graph
figure;
plot(x, I_values);
xlabel('Test mass displacement (m)');
ylabel('Coil current (A)');

% Calculate Lorentz force
I_max = max(I_values); % maximum coil current value
F_Lorentz = B * L * n * I_max; % Lorentz force value
disp(['Lorentz force = ' num2str(F_Lorentz) ' N']);
