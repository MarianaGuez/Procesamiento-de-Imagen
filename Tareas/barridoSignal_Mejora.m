imgNegra = zeros(1500,1500);

wDeg = 1;  %tamaño de imagen(en grados)
nPix = 1000;  %resolución de la imagen (en pixeles)

[x,y] = meshgrid(linspace(-wDeg/2,wDeg/2,nPix+1));

expo = 0.8*4.5*exp(4.5*x);
func = (sin(2*pi*expo).*exp(y*12));

imagesc(func);
axis equal
axis off
colormap("gray")

impixelinfo;