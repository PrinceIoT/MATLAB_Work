% define input data
gps = [2441775 2441277 799287;3464656 3464161 845805;3309992 3309497 828982;3160763 3160270 759205; 2248123 2247621 865698;3022573 3022077 802985;3104219 3103717 998426;2998190 2997689 931490;3199093 3198594 932277;3370659 3370169 711929;3341340 3340841 957963;2534031 2533526 975196;2838910 2838409 903855;2902495 2902000 761491;2682408 2681905 950423];
local=[5818162 799268 5818729;5269712 845750 5270272;5370322 828932 5370882;5468784 759160 5469346;5885856 865687 5886426; 5540121 802946 5540684;5462728 998384 5463291;5532835 931452 5533398;5419761 932231 5420322;5349228 711877 5349787;5329443 957912 5330003;5751511 975174 5752078;5620096 903822 5620660;5609296 761456 5609860;5688427 950396 5688993];

%computation of local
%local = s*gps*R + t

% center the data around the mean
gps_mean = mean(gps);
local_mean = mean(local);
gps_centered = gps - gps_mean;
local_centered = local - local_mean;

% compute rotation matrix using SVD
[U,~,V] = svd(gps_centered'*local_centered);
R = V*U';

% compute translation vector
t= local_mean - R*gps_mean';

% compute scale factor
%creating variables for the multiplication of matrices
m = local_centered'*gps_centered;
n = m*R;
o = gps_centered'*gps_centered;

scale = trace(n)/trace(o);

% print results
fprintf('Rotation matrix:\n');
disp(R);
fprintf('Translation vector:\n');
disp(t);
fprintf('Scale factor:\n');
disp(scale);