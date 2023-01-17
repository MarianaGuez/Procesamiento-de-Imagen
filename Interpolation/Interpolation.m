im =imread("pentagon256x256.tif");
%1. creating an oversampling image T ↑= 2 × 2 and T ↑= 4 × 4.
T = 2;
T2 = matriz(T,im);
figure('Name',"Spatial Oversampling T2")
imshow(T2,[])

T = 4;
T4 = matriz(T,im);
figure('Name',"Spatial Oversampling T4")
imshow(T4,[])
%%
%DFT spectrum magnitude for each of the images previous created and the
%original

DFT_og = abs(fft2(im));
DFT_t2 = abs(fft2(T2));
DFT_t4 = abs(fft2(T4));

ShiftDFT_og = fftshift(DFT_og);
ShiftDFT_t2 = fftshift(DFT_t2);
ShiftDFT_t4 = fftshift(DFT_t4);

Im_og = log(1.0 + ShiftDFT_og);
Im_t2 = log(1.0 + ShiftDFT_t2);
Im_t4 = log(1.0 + ShiftDFT_t4);

figure('Name',"DFT: Original, T2, T4")
subplot(1,3,1)
imshow(Im_og,[]);
subplot(1,3,2)
imshow(Im_t2,[]);
subplot(1,3,3)
imshow(Im_t4,[]);
%%
% As in the previous example was shown, the spatial oversampling generate
% patterns of low frequencies, while the oversampling increase the pattern
% also become more frequent

%On the other hand, if the ceros are collocated on the DFT spectrum then in
%the spatial domain the image repeated itself as can be shown with the nect
%code:

DFT_t2 = fft2(im);
ShiftDFT_t2 = fftshift(DFT_t2);
cerosDFT = matriz(2,ShiftDFT_t2);
ShiftDFT_ceros = fftshift(cerosDFT);
Im_t = ifft2(ShiftDFT_ceros);
Im_t2 = abs(Im_t);
imshow(Im_t2,[])
%% Spatial Domain Interpolation
%Filters are used to generate the interpolation on the spatial domain

h = [1,1]'*[1,1];
InterpT2_0 = conv2(T2,h,"same");
figure('Name', "Interpolation Cero Order T2")
imshow(uint8(InterpT2_0))
RECT = [10,10,20,20];
zoom_T2_0 = imcrop(InterpT2_0,RECT);

h = [1;1;1;1]*[1 1 1 1];
InterpT4_0 = conv2(T4,h,"same");
figure('Name', "Interpolation Cero Order T4")
imshow(uint8(InterpT4_0))
zoom_T4_0 = imcrop(InterpT4_0,RECT);


DFT_t2 = abs(fft2(InterpT2_0));
DFT_t4 = abs(fft2(InterpT4_0));

ShiftDFT_t2 = fftshift(DFT_t2);
ShiftDFT_t4 = fftshift(DFT_t4);

DFTInterpT2_0 = log(1.0 + ShiftDFT_t2);
DFTInterpT4_0 = log(1.0 + ShiftDFT_t4);
%%
% Lineal
h = [0.5;1;0.5]*[0.5 1 0.5];

InterpT2_L = conv2(T2,h,"same");
figure('Name', "Lineal Interpolation T2")
imshow(uint8(InterpT2_L))
RECT = [10,10,20,20];
zoom_T2_L = imcrop(InterpT2_L,RECT);   

h = [0.25;0.5;0.75;1;0.75;0.5;0.25]*[0.25 0.5 0.75 1 0.75 0.5 0.25];
InterpT4_L = conv2(T4,h,"same");
figure('Name', "Lineal Interpolation T4")
imshow(uint8(InterpT4_L))
zoom_T4_L = imcrop(InterpT4_L,RECT);

DFT_t2 = abs(fft2(InterpT2_L));
DFT_t4 = abs(fft2(InterpT4_L));

ShiftDFT_t2 = fftshift(DFT_t2);
ShiftDFT_t4 = fftshift(DFT_t4);

DFTInterpT2_L = log(1.0 + ShiftDFT_t2);
DFTInterpT4_L = log(1.0 + ShiftDFT_t4);
%%
% Cubic
x = -3:0.5:3;
h = impulse(x);
m = h'*h;

InterpT2_C = conv2(T2,m,"same");
figure('Name', "Cubic Interpolation T2")
imshow(uint8(InterpT2_C))
RECT = [10,10,20,20];
zoom_T2_C = imcrop(InterpT2_C,RECT);
x = -3:0.25:3;
h = impulse(x);
m = h'*h;
InterpT4_C = conv2(T4,m,"same");
figure('Name', "Cubic Interpolation T4")
imshow(uint8(InterpT4_C))

zoom_T4_C = imcrop(InterpT4_C,RECT);

DFT_t2 = abs(fft2(InterpT2_C));
DFT_t4 = abs(fft2(InterpT4_C));

ShiftDFT_t2 = fftshift(DFT_t2);
ShiftDFT_t4 = fftshift(DFT_t4);

DFTInterpT2_C = log(1.0 + ShiftDFT_t2);
DFTInterpT4_C = log(1.0 + ShiftDFT_t4);
%%
% Zooming each image in the same location to compare
figure('Name', "Zoom 20x20 pixeles")
subplot(2,3,1)
imshow(uint8(zoom_T2_0))
title('Orden 0 T2') 
subplot(2,3,2)
imshow(uint8(zoom_T4_0))
title('Lineal T2')
subplot(2,3,3)
imshow(uint8(zoom_T2_L))
title('Cubic T2')
subplot(2,3,4)
imshow(uint8(zoom_T4_L))
title('Orden 0 T4')
subplot(2,3,5)
imshow(uint8(zoom_T2_C))
title('Lineal T4')
subplot(2,3,6)
imshow(uint8(zoom_T4_C))
title('Cubic T4')
%%
% Obtaining the DFT spectrum of each of the interpolated images
figure
subplot(3,2,1)
imshow(DFTInterpT2_0,[])
title('DFT Orden 0 T2')
subplot(3,2,2)
imshow(DFTInterpT4_0,[])
title('DFT Orden 0 T4')
subplot(3,2,3)
imshow(DFTInterpT2_L,[])
title('DFT Lineal T2')
subplot(3,2,4)
imshow(DFTInterpT4_L,[])
title('DFT Lineal T4')
subplot(3,2,5)
imshow(DFTInterpT2_C,[])
title('DFT Cúbica T2')
subplot(3,2,6)
imshow(DFTInterpT4_C,[])
title('DFT Cúbica T4')
%% Frequency Domain Interpolation

DFT_og = fft2(im);
ShiftDFT_og = fftshift(DFT_og);
Mag_og = log(1.0 + abs(ShiftDFT_og));
figure('Name',"Zero Padding DFT: Original Image")
imshow(Mag_og,[]);

zeroPad_T2 = padarray(ShiftDFT_og,[128,128],0,'both');
ShiftDFT_T2 = 4*fftshift(zeroPad_T2);
Mag_T2 = log(1.0 + abs(zeroPad_T2));
inverse_T2 = abs(ifft2(ShiftDFT_T2));
figure('Name',"Zero Padding DFT: Interpolation T2")
imshow(Mag_T2,[]);

zeroPad_T4 = padarray(ShiftDFT_og,[384,384],0,'both');
ShiftDFT_T4 = 16*fftshift(zeroPad_T4);
Mag_T4 = log(1.0 + abs(zeroPad_T4));
inverse_T4 = abs(ifft2(ShiftDFT_T4));
figure('Name',"Zero Padding DFT: Interpolation T4")
imshow(Mag_T4,[]);
%%
% Comparing the DFT magnitudes 
figure('Name',"DFT's Magnitude: Interpolated Images")
subplot(2,4,1)
imshow(DFTInterpT2_0,[])
title('0 Order T2')
subplot(2,4,2)
imshow(DFTInterpT2_L,[])
title('Lineal T2')
subplot(2,4,3)
imshow(DFTInterpT2_C,[])
title('Cubic T2')
subplot(2,4,4)
imshow(Mag_T2,[])
title('Zero-padding T2')
subplot(2,4,5)
imshow(DFTInterpT4_0,[])
title('0 Order T4')
subplot(2,4,6)
imshow(DFTInterpT4_L,[])
title('Lineal T4')
subplot(2,4,7)
imshow(DFTInterpT4_C,[])
title('Cubic T4')
subplot(2,4,8)
imshow(Mag_T4,[])
title('Zero-padding T4')
%%
% Calcualting the IDFT 
figure('Name',"Zero-padding T2")
imshow(uint8(inverse_T2))
figure('Name',"Zero-padding T4")
imshow(uint8(inverse_T4))
%% 
% Function to insert zeros on the image for the spatial interpolation

function [imF] = matriz(T,im)
[alto, largo] = size(im);
a = alto*T;
b = largo*T;
im2 = zeros(a,b);
for y = 1:alto
    for x = 1:largo
        im2(T*y,T*x) = im(y,x);
    end
end
imF = im2;
end
%% Cubic interpolation function
function [h] = impulse(x)

sn = x;
for i=1:size(x,2)
    if((abs(x(1,i)) > 0) && (abs(x(1,i)) < 1))

        sn(1,i) = 4*abs(x(1,i))^3/3 - 7*abs(x(1,i))^2/3 + 1;

    elseif((abs(x(1,i)) > 1) && (abs(x(1,i)) < 2))

        sn(1,i) = -7*abs(x(1,i))^3/12 + 3*abs(x(1,i))^2 - 59*abs(x(1,i))/12 + 15/6;

    elseif((abs(x(1,i)) > 2) && (abs(x(1,i)) < 3))

        sn(1,i) = abs(x(1,i))^3/12 - 2*abs(x(1,i))^2/3 + 21*abs(x(1,i))/12 - 3/2;

    elseif(abs(x(1,i))==0)

        sn(1,i) = 1;

    else

        sn(1,i) = 0;

    end
end
h = sn;
end