P=imread("Fig0539(c)(shepp-logan_phantom).tif")
%O_I=imread("output_image2.PNG");
imshow(P),title("Fig0539 Image");

%3x3 Matrix Filter
se=[1/9,1/9,1/9
    1/9,1/9,1/9
    1/9,1/9,1/9
    ];
%Filtering 
new_P=imfilter(P,se);
%new_P=O_I;
imshow(new_P);

%PNSR 
[peaksnr snr] = psnr(P,new_P);

%MSE
mse=immse(P,new_P);

%SNR
%ssimval = ssim(P,new_P);



%print
[peaksnr mse snr]