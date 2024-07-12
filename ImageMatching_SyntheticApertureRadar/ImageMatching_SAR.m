%Basic functions to know for the task to complete
%With an example image
Img = imread("pinos512.tif");
figure('Name','Imagen Original');
subplot(1,2,1);imshow(Img);
subplot(1,2,2);imhist(Img);ylim([0 inf])
%1. Obtain an Histogram
imgEq=histeq(Img);
figure('Name','Imagen Ecualizada');
subplot(1,2,1);imshow(imgEq);
subplot(1,2,2);imhist(imgEq);ylim([0 inf])
% 2. Quantization of an image (2, 4, 8, 16, 32, 64 y 128)
% The function is at the end of this program
Quantization(Img,0)
%% Start of the program for matching images
% a) Cut the satellite images to eliminate any inecessary information. In
% our case, the black areas.
ZoneBL = imread('zoneB_b5.tif');
ZoneAL = imread('zoneA_b5.tif');

ZoneA = imcrop(ZoneAL, [1 1 1762 1500]);
ZoneB = imcrop(ZoneBL, [1231 1 1270 1500]);
% print the image with its histogram
figure('Name','Zone A and its histogram');
subplot(1,2,1);imshow(ZoneA);
subplot(1,2,2);imhist(ZoneA);ylim([0 inf])
figure('Name','Zone B and its histogram');
subplot(1,2,1);imshow(ZoneB)
subplot(1,2,2);imhist(ZoneB);ylim([0 inf])
%%
%Showing a careless joint of the images
matrix1= imcrop(ZoneA,[1 1 1230 1500]);
matrix3 = imcrop(ZoneB,[531 1 737 1500]);

matchtA = double(imcrop(ZoneA,[1231 1 530 1500]));
matchtB = double(imcrop(ZoneB,[1 1 530 1500])); 

matriz2 = (matchtA+matchtB)./2; %Creat an image from the overlapping area

mosaic = [matrix1 uint8(matriz2) matrix3]; %Joint it all together
figure('Name','Mosaic and its histogram');
imshow(mosaic)
%%
% Show the histogram of the overlapping area 
figure('Name','Overlapping zone');
imshow(uint8(matriz2))
hisTanslape = imhist(uint8(matriz2));
figure('Name','Overlapping histogram');
imhist(uint8(matriz2));ylim([0 inf])
%%
% the code shows the two images equalizaed with the histogram of the
% overlapping area
ZoneAEq = im2uint8(histeq(ZoneA,hisTanslape));
ZoneBEq = im2uint8(histeq(ZoneB,hisTanslape));
figure('Name','Zone A Equalized with the overlapping histogram');
subplot(1,2,1);imshow(ZoneAEq);
subplot(1,2,2);imhist(ZoneAEq);ylim([0 inf])
figure('Name','zone B Equalized with the overlapping histogram');
subplot(1,2,1);imshow(ZoneBEq);
subplot(1,2,2);imhist(ZoneBEq);ylim([0 inf])
%%
% Display the joint images after the specification of the histogram
Zone = imhist(mosaic);
figure('Name','Carelees joint')
imshow(mosaic)

% Match the histogram of Zone A with the histogram of Zone B
HB = imhist(ZoneB);
matchA = im2double(histeq(ZoneA,HB));
zoneB = im2double(ZoneB);

% cut Zone A matched to the histogram of Zone B, remove the overlapping
match1 = imcrop(matchA,[1 1 1230 1500]);
% cut Zone B without overlapping
match2 = imcrop(zoneB,[531 1 737 1500]);

% cut overlapping of Zone A 
matchtA = imcrop(matchA,[1231 1 530 1500]);
% cut overlapping of Zone B
matchtB = imcrop(zoneB,[1 1 530 1500]); 

%Create a average of the values within the overlapping from the equalized images of Zone A and B
overlapping = (matchtA+matchtB)./2;
hist=imhist(overlapping);


matchFuseImg = [match1 overlapping match2];
match=im2uint8(histeq(matchFuseImg,Zone));

figure('Name','Final Image');imshow(match);impixelinfo
figure('Name','Final Histogram');imhist(match);ylim([0 inf])


%% 
%If necessary quantize the image so the joint be less evident considere
%that it will deppends on the task
Quantization(match,1)
%% Función de Cuantización
function Quantization(imagen, option)
    for i = 1:7
        num = 2^i;
        if option==1
            J=imhist(imagen,num);
            histeqlevel = histeq(imagen,J);
        else
            histeqlevel = histeq(imagen,num);
        end
        figure('Name', sprintf('Nivel de cuantizacion: %d', num));
        subplot(1,2,1);imshow(histeqlevel);
        subplot(1,2,2);imhist(histeqlevel);ylim([0 inf])
    end
end
