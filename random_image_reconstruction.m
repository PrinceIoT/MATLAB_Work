% First we make axes visible for the Image Scale
iptsetpref('ImshowAxesVisible','on')

%Read the Image from Local Computer Using Imread Function.
I=imread("Fig0533(a)(circle).tif")
I(25:75, 25:75) = 1;

% We create the Random Transform function that will help in Image
% Reconstruction.
theta = 0:360;
[R,xp] = radon(I,theta);

%Display The Image on the Axes using imshow function. 
imshow(R,[],'Xdata',theta,'Ydata',xp,'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar
