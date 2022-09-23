%%                              EJERCICIO 1                           %%
%Abrir y vizualizar la imagen RGB "magriconRGB.jpg"y cada una de sus
%componentes de color por separado, usando la paleta de colores roja, verde
%y azul.
%Usar las funciones image, imagesc e imshow. Ve cuales son las diferencias
%entre estas. Agrega a las funciones de imagesc e image colormap en RGB.
%Notar que le paso a la imagen

magriclon = imread("magriclonRGB.jpg"); %carga la imagen

%                       Usando función imshow
% Is the fundamental image display function in MATLAB, optimizing
% figure, axes, and image object property settings for image display.

figure('Name','Ejercicio 1');
nexttile                            %Añade una imagen a la misma figura
imshow(magriclon);title('Imshow'); %Se utiliza imshow para graficar
%imshow es una fucnion que trata de comprimir los valores de la imagen
%debido a que es una de las funciones en matlab para mostrar imagenes que cuenta con
%más subfunciones (parámetros) posibles a utilizar.

nexttile
imshow(magriclon(:,:,1), 'Colormap', jet(256)); title('Componente rojo'); %Muestra la primer capa de la imagen y hace un coloreado artificial con colormap, jet es la gama de colores que se utilizan 
nexttile
imshow(magriclon(:,:,2), 'Colormap', jet(256)); title('Componente verde'); %Muestra la segunda capa de la imagen
nexttile
imshow(magriclon(:,:,3), 'Colormap', jet(256)); title('Componente azul'); %Muestra la tercera capa de la imagen

%                      Usando función Image
%   Muestra un arreglo como imagen       

figure('Name','Ejercicio 1');
nexttile
image(magriclon); title('Image');  %Muy parecido a imshow pero no optimiza los valores de la imagen, 
% tiene más subfunciones con las que se puede escalar el mapa de colores a un cierto rango de valores
nexttile
image(magriclon(:,:,1));title('Componente de Rojo'); 
nexttile
image(magriclon(:,:,2));title('Componente de verde');
nexttile
image(magriclon(:,:,3));title('Componente de azul');
colormap("jet");

%                    Usando función Imagesc
%Imagesc es como image, excepto que la imformacion es escalada para usar
%todo el mapa de colores

figure('Name','Ejercicio 1');
nexttile
imagesc(magriclon);title('Imagesc'); 
nexttile
imagesc(magriclon(:,:,1));title('Componente de Rojo');
nexttile
imagesc(magriclon(:,:,2));title('Componente de verde');
nexttile
imagesc(magriclon(:,:,3));title('Componente de azul');
colormap("jet");

%%                           EJERCICIO 2                              %%                        
%Abrir y desplegar la imagen RGB "retinaRGB.jpg" y convertir cambiando el
%espacio de color de: 
%RGB a Escala de grises
%RGB a YUV
%RGB a HSV


figure('Name','Ejercicio2')
nexttile
retina = imread('retinaRGB.jpg');image(retina);title('RGB');
nexttile
retinaGrises = rgb2gray(retina);image(retinaGrises);title('Escala de Grises'); %rgb2gray es la funcion para convertir imagenes rgb a gris
nexttile
retinaHSV = rgb2hsv(retina);image(retinaHSV);title('HSV'); %rgb2hsv es la funcion para convertir imagenes rgb a valor de saturación de tono. El tono se mide en grados de 0 a 360. 
nexttile
retinaYUV = rgb2ycbcr(retina);image(retinaYUV); title('YUV'); %rgb2ycbcr es la función para convertir imagenes rgb a el modelo YUV
% éste modelo define un componente de luminancia (Y), que significa brillo de espacio lineal físico, y dos componentes de crominancia, llamados U (proyección azul) y V (proyección roja).

%%                          EJERCICIO 3                               %%
%Leer y desplegar la imagen del archivo "corte.bmp" y obtener una imagen
%cortada a un tercio de su tamaño, realice el corte(crop) en la
%esquina inferior derecha. Realice otra subimagen donde usted desee.

corte = imread('corte.bmp');
Ymin = 0;
Xmin = (size(corte,1)*2)/3;
width_ = size(corte,2);
height_ = (size(corte,1))/3;

I2 = imcrop(corte,[Ymin, Xmin, width_, height_]); %imcrop es el comando para cortar una imagen siendo Ymin y Xmin el punto más pequeño de la seccion a cortar
% width y height el ancho y el alto de la seccion
imshow(I2);
%%                           EJERCICIO 4                              %%
%Leer la imagen del archivo "rxcerv.pcx" y desplegarla usando primero el
%comando image y usando posteriormente el comando imshow.

rxcerv = imread("rxcerv.pcx");
figure('Name','Image');image(rxcerv); 
figure('Name', 'imshow');imshow(rxcerv);
%En este ejercicio se observa claramente que la funcion imshow busca
%optimizar la imagen, en este caso pasandola a escala de grises
%%                          EJERCICIO 5                               %%
%Leer y desplegar la imagen "abdomen.png" usando el comando image y 
% usando posteriormente el comando imagesc 

abdomen = imread("abdomen.png");
figure('Name','Image'); image(abdomen);
figure('Name','Imagesc'); imagesc(abdomen); 
%En este ejercicio es de la misma forma, sin embargo, ahora baja la
%resolución

%%                          EJERCICIO 6                               %%
%Despliega la paleta de colores RGB por separado
Lena = imread('LenaOrig.jpg');
figure('Name', 'Ejercicio 6: Lena con colorbar');
nexttile
imagesc(Lena); title('Lena'); 
nexttile
imagesc(Lena(:,:,1));title('Componente de Rojo'); 
colorbar
nexttile
imagesc(Lena(:,:,2));title('Componente de verde');
colorbar
nexttile
imagesc(Lena(:,:,3));title('Componente de azul');
colormap("jet");
colorbar

%%                         EJERCICIO 7                                %%
% Visualizar la imagen "intestinoRGB.jpg" con diferentes paletas de colores
%predefinidas de MATLAB

intestino = imread("IntestinoRGB.jpg");

figure('Name','Ejercicio 7: Intestino Copper');
nexttile
imshow(intestino);title('Intestino'); 
nexttile
imshow(intestino(:,:,1), 'Colormap', copper(256)); title('Componente rojo');
nexttile
imshow(intestino(:,:,2), 'Colormap', copper(256)); title('Componente verde');
nexttile
imshow(intestino(:,:,3), 'Colormap', copper(256)); title('Componente azul');


figure('Name','Ejercicio 7: Intestino Parula');
nexttile
imagesc(intestino);title('Intestino'); 
nexttile
imagesc(intestino(:,:,1));title('Componente de Rojo');
nexttile
imagesc(intestino(:,:,2));title('Componente de verde');
nexttile
imagesc(intestino(:,:,3));title('Componente de azul');
colormap("parula");

figure('Name','Ejercicio 7: Intestino Prism');
nexttile
imshow(intestino);title('Intestino'); 
nexttile
imshow(intestino(:,:,1), 'Colormap', hsv(256)); title('Componente rojo');
nexttile
imshow(intestino(:,:,2), 'Colormap', hsv(256)); title('Componente verde');
nexttile
imshow(intestino(:,:,3), 'Colormap', hsv(256)); title('Componente azul');

%%                            EJERCICIO 8                             %%
%Visualizar la imagen indexada "cta_scan_index.bmp" Rota la imagen a 45,
%90,180 grados
cta = imread("cta_scan_index.bmp");
figure('Name','imagen indexada');
nexttile
image(cta);colormap;title('Imagen Original');
nexttile
rotada45 = imrotate(cta,45);                    %imrotate es la funcion para rotar la imagen, cta es la imagen a rotar, seguido de los grados a rotar
image(rotada45);title('Imagen Rotada 45°');
nexttile
rotada90 = imrotate(cta, 90);
image(rotada90);title('Imagen Rotada 90°');
nexttile
rotada180 = imrotate(cta, 180);
image(rotada180);title('Imagen Rotada 180°');

%%                            EJERCICIO 9                             %%
%Convierte la imagen mir.jpg a escala de grises y guardala en formato .tif

mri = imread('mri.jpg');
mriGris = rgb2gray(mri);
imwrite(mriGris,'mri.tif');                 %imwrite guarda la imagen en tu computadora con el formato escogido
%%       Función interesante   para    RGB                            %%
%Esta función se me hizo interesante porque con colormap no pude encontrar
%la forma de representar las componentes con los colores rojo, azul y
%verde, imsplit() es una función que permite guardar cada una de las capas
%de una imagen en diferentes variables.

%una vez teniendolas se puede desplegar concatenando con valores de ceros y
%entonces observar las imagenes en verde, rojo y azul.

imagenColor = imread('magriclonRGB.jpg');

[R,G,B] = imsplit(imagenColor);

figure
subplot(1,3,1)
imshow(R)
title('Componente roja')

subplot(1,3,2)
imshow(G)
title('Componente Verde')

subplot(1,3,3)
imshow(B)
title('Componente Azul')


imgNegra = zeros(size(imagenColor,1,2),class(imagenColor));
desplegarR = cat(3,R,imgNegra,imgNegra);
desplegarV = cat(3,imgNegra,G,imgNegra);
desplegarA = cat(3,imgNegra,imgNegra,B);


figure

subplot(2,2,1)
imshow(imagenColor)
title('Imagen')

subplot(2,2,2)
imshow(desplegarR)
title('Componente Roja')

subplot(2,2,3)
imshow(desplegarV)
title('Componente Verde')

subplot(2,2,4)
imshow(desplegarA)
title('Componente Azul')







