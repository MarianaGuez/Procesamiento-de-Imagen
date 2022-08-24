%%                          EJERCICIO 10.1                            %% 
%%% Simular el movimiento del corazon imprimeindo las 280 imagenes dicom en
%%% una sola ventana.

folder = '/home/mxgz/Documents/Maestria/Diversion/ProcesamientoImagen/Práctica0/Ejercicio10'; %Dirección donde estan guardadas las imagenes
filesnames = dir(fullfile(folder,'*.dcm')); %la funcion dir() enlista los archivos de un folder, la funcion fullfile() construye la especificacion 
% completa del archivo envase al folder y al nombre del archivo. en este
% caso todos los archivos con extención .dcm
total_Img = numel(filesnames); %Numel regresa el numero de elementos

 for n = 1:total_Img
     f = fullfile(folder,filesnames(n).name);
     theImage = dicomread(f);               %dicomread() se utiliza para leer archivos con extención .dcm
     imshow(theImage,[]);
     pause(.01)             %realiza una pausa de .01 segundos
 end