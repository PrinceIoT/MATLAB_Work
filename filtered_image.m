% Read in the projection data from a file
projection_data = load('neuron.xlsx');

% Extract the projection angles and the projection data from the structure
angles = projection_data.angles;
projections = projection_data.projections;

% Determine the number of projections and the size of each projection
[num_projections, projection_size] = size(projections);

% Set the reconstruction grid size
grid_size = 512;

% Create a grid of x and y coordinates for the reconstruction
[X, Y] = meshgrid(1:grid_size, 1:grid_size);

% Set the starting value for the reconstructed image to zero
reconstructed_image = zeros(grid_size, grid_size);

% Set the filter width for the Fan-Bean filter
filter_width = 10;

% Loop through each projection
for i = 1:num_projections
    % Get the current projection and angle
    projection = projections(i,:);
    angle = angles(i);

    % Rotate the grid of x and y coordinates by the projection angle
    X_rotated = cos(angle)*X - sin(angle)*Y;
    Y_rotated = sin(angle)*X + cos(angle)*Y;

    % Interpolate the projection data onto the rotated grid
    projection_interp = interp2(projection, X_rotated, Y_rotated);

    % Apply the Fan-Bean filter to the interpolated projection data
    projection_filtered = fbp_fan_bean_filter(projection_interp, filter_width);

    % Backproject the filtered projection data onto the reconstruction grid
    reconstructed_image = reconstructed_image + fbp_backproject(projection_filtered, angle, X, Y);
end

% Divide the reconstructed image by the number of projections to average the result
reconstructed_image = reconstructed_image / num_projections;

% Display the reconstructed image
imshow(reconstructed_image, []);
