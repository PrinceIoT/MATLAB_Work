%imread function is used to read the image from the computer. We use Fig0533(a)(circle) as the
%test image.
P=imread("Fig0533(a)(circle).tif")
imshow(P),title("Fig0533 Image");

%3x3 Matrix Filter for image processing.
se=[1/5,1/5,1/5
    1/5,1/5,1/5
    1/5,1/5,1/5
    ];
%Filtering  the new image.
new_P3=imfilter(P,se);
imshow(new_P3);

%PNSR 
[peaksnr snr] = psnr(P,new_P3);

%MSE
mse=immse(P,new_P3);

%print the outputs of pnsr, mse and snr
[peaksnr mse snr]