
P=phantom(256);

output_size = max(size(P));

D = 250; 
dsensor1 = 2;
F1 = fanbeam(P,D,'FanSensorSpacing',dsensor1);

dsensor2 = 1;
F2 = fanbeam(P,D,'FanSensorSpacing',dsensor2);

dsensor3 = 0.25;
[F3,sensor_pos3,fan_rot_angles3] = fanbeam(P,D, ...
    'FanSensorSpacing',dsensor3);

Ifan1 = ifanbeam(F1,D,'FanSensorSpacing',dsensor1, ...
    'OutputSize',output_size);
Ifan2 = ifanbeam(F2,D,'FanSensorSpacing',dsensor2, ...
    'OutputSize',output_size);
Ifan3 = ifanbeam(F3,D,'FanSensorSpacing',dsensor3, ...
    'OutputSize',output_size);

montage({Ifan1,Ifan2,Ifan3},'Size',[1 3])
title(['Reconstruction from Fan Beam Projection with '...
    '18, 24, and 90 Projection Angles'])