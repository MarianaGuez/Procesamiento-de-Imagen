I = imread('LenaOrig.jpg');
I=rgb2gray(I);

figure('Name','Original');
imshow(I)

[largo,alto]=size(I);
Bin=I;
Dithering_Random=I;
Dithering_Ordered=I;
Dithering_Ordered2=I;

D=[3.0 1.0;
    0.0 2.0]/4;

D4=[15.0 7.0 13.0 5.0;
    3.0 11.0 1.0 9.0; 
    12.0 4.0 14.0 6.0; Dithering_Random
    0.0 8.0 2.0 10.0]/16;

for x=1:largo
    for y=1:alto
        Bin(x,y) =   round(double(I(x,y))/255);
        Dithering_Random(x,y) =  round(double(I(x,y))/255+0.3*rand(1));
        Dithering_Ordered(x,y) =  round(double(I(x,y))/255+0.2*D(mod(y,2)+1,mod(x,2)+1));
        Dithering_Ordered2(x,y) = round(double(I(x,y))/255+0.2*D4(mod(y,4)+1,mod(x,4)+1));
    end
end

figure('Name','Binary');
Bin=logical(Bin);
imshow(Bin)

figure('Name','Random2');
Dithering_Random=logical(Dithering_Random);
imshow(Dithering_Random)

figure('Name','Ordered1');
Dithering_Ordered=logical(Dithering_Ordered);
imshow(Dithering_Ordered)

figure('Name','Ordered2');
Dithering_Ordered2=logical(Dithering_Ordered2);
imshow(Dithering_Ordered2)


Dithering_FS=I;

for x=2:largo-1
    for y=1:alto-1

        e = double(I(x,y))-255*round(double(I(x,y))/255);    
        Dithering_FS(x,y) = 255*round(double(I(x,y))/255); 

        I(x+1,y)   = I(x+1,y)   + e*7/16;
        I(x-1,y+1) = I(x-1,y+1) + e*3/16;
        I(x,y+1)   = I(x,y+1)   + e*5/16;
        I(x+1,y+1) = I(x+1,y+1) + e*1/16;

    end
end
%Dithering_FS(:,y)=0;
%Dithering_FS(1,:)=0;
%Dithering_FS(x,:)=0;
figure('Name','Dithering_FS');
Dithering_FS=logical(Dithering_FS);
imshow(Dithering_FS)

