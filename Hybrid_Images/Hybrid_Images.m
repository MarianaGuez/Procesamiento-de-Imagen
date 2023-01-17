%% Levels sum
woman = imread("woman.jpg");
woman = rgb2gray(woman);
girl = imread("girl.jpg");
girl = rgb2gray(girl);

k1 = 0.75;
k2 = 0.25;

figure('Name','Woman (low filter) & Girl (High Filter)')
for i = 1:6
    subplot(1,6,i)
    X = SumaNiveles(woman,girl,i,k1,k2);
    imagesc(uint8(X))
    colormap('gray');
end

figure('Name','Girl (low filter) & Woman (High Filter)')
for i = 1:6
    subplot(1,6,i)
    X = SumaNiveles(girl,woman,i,k1,k2);
    imagesc(uint8(X))
    colormap('gray');
end

%% Levels Sum
michelle = imread("michelle_obama.jpg");
michelle = rgb2gray(michelle);
Obama = imread("obama.jpg");
Obama = rgb2gray(Obama);

k1 = 0.85;
k2 = 0.15;

figure('Name','Michalle & Obama')
for i = 1:6
    subplot(2,3,i)
    X = SumaNiveles(michelle,Obama,i,k1,k2);
    imagesc(X)
    colormap('gray');
end

figure('Name','Obama & Michalle')
for i = 1:6
    subplot(2,3,i)
    X = SumaNiveles(Obama,michelle,i,k1,k2);
    imagesc(X)
    colormap('gray');
end
%% Hybrid Reconstruction
Apple = imread("apple1.jpg");
Apple = rgb2gray(Apple);
Orange = imread("orange1.jpg");
Orange = rgb2gray(Orange);

figure('Name','Apple & Orange')
for i = 0:4
    subplot(1,5,5-i)
    I = Apple_orange(Apple,Orange,i+1);
    imshow(I,[])
end
figure('Name','Original Images')
subplot(1,2,1);
imagesc(Apple)
subplot(1,2,2);
imagesc(Orange)
colormap('gray');
%% Hybrid Reconstruction
michelle=imread("michelle_obama.jpg");
michelle=rgb2gray(michelle);
Obama=imread("obama.jpg");
Obama=rgb2gray(Obama);

figure('Name',' Obama & Michelle')
for i=0:4
    subplot(2,3,i+1)
    I=Reconstruccion_Hibrida(Obama,michelle,i+1, 0.78,0.22);
    imshow(uint8(I))
end

figure('Name','Michelle & Obama')
for i=0:4
    subplot(2,3,i+1)
    I=Reconstruccion_Hibrida(michelle,Obama,i+1, 0.78,0.22);
    imshow(uint8(I))
end
%% Hybrid Reconstruction
woman=imread("woman.jpg");
woman=rgb2gray(woman);
girl=imread("girl.jpg");
girl=rgb2gray(girl);

figure('Name','Girl & Woman')
for i=0:4
    subplot(2,3,i+1)
    I=Reconstruccion_Hibrida(girl,woman,i+1, 0.7,0.3);
    imshow(uint8(I))
end

figure('Name','Woman & Girl')
for i=0:4
    subplot(2,3,i+1)
    I=Reconstruccion_Hibrida(woman,girl,i+1, 0.78,0.22);
    imshow(uint8(I))
end

%% Suma de niveles
function[M]=SumaNiveles(L,H,Nivel,k1,k2)
    %%H es la imagen que proporciona las frecuencias altas
    %%L es la imgen que proporciona las frecuencias bajas
    %%Nivel es el nivel al que se quiere realizar la suma
    %%k1 y k2 son los pesos por los que se multiplican las imagenes H y L
    X=PiramideLaplaciana(H,Nivel);
    X=X+128*double(ones(size(X)));%%%Se suma 128 para normailizar laplacianos
    Y=PiramideGaussiana(L,Nivel);
    Y=imresize(Y, size(X));
    M=k1*double(X)+k2*double(Y);
end
%% Apple_orange
function[M]=Apple_orange(A,B,Nivel)
    [r,c]=size(B);
    r_nivel=round(r/2^(Nivel-1));
    c_nivel=round(c/2^(Nivel-1));
    Mask1 = [ones(r_nivel,round(c_nivel/2)) zeros(r_nivel,c_nivel-round(c_nivel/2))];
    Mask2 = [zeros(r_nivel,round(c_nivel/2)) ones(r_nivel,c_nivel-round(c_nivel/2))];
    if(Nivel==5)
        %%%Componentes paso baja imagen A
        L1=PiramideGaussiana(A, Nivel);
        L1=imresize(L1,[r_nivel, c_nivel],"cubic");
        L1=immultiply(double(L1),double(Mask1));
        %%%%Compinentes paso alta imagen A
        H1=PiramideLaplaciana(A, Nivel);
        H1=immultiply(double(H1),double(Mask1));
        %%%Componentes paso baja imagen B
        L2=PiramideGaussiana(B, Nivel);
        L2=imresize(L2,[r_nivel, c_nivel],"cubic");
        L2=immultiply(double(L2),double(Mask2));
        %%%%Compinentes paso alta imagen B
        H2=PiramideLaplaciana(B,Nivel);
        H2=immultiply(double(H2),double(Mask2));
        %%Suma de matrices
        L=L1+L2;
        H=H1+H2;
        M=L+H;
    else
        Temp=Apple_orange(A,B, Nivel+1); %%%Recursividad la función se manda a llamar a si misma
        Temp=double(imresize(double(Temp),[r_nivel, c_nivel],"cubic"));%%Imagen del escalón anterior
        H1=PiramideLaplaciana(A, Nivel);
        H1=immultiply(double(H1),double(Mask1));
        H2=PiramideLaplaciana(B,Nivel);
        H2=immultiply(double(H2),double(Mask2));
        H=H1+H2;
        M=Temp+H;
    end
end

%% Reconstrucción
function[M]=Reconstruccion_Hibrida(A,B,Nivel,k1,k2) %%La imagen A proporciona frecuencias bajas
    %%La imagen B proporciona frecuencias altas
    %%El nivel representa el nivel de la pirámide de la imagen reconstruida
    [r,c]=size(B);
    if(Nivel==5)
        H=PiramideLaplaciana(B,Nivel);
        H=H+128*double(ones(size(H)));
        M=k1*double(imresize(uint8(A),[round(r/2^(Nivel-1)), round(c/2^(Nivel-1))],"cubic"))+k2*H;
    else
        Temp=Reconstruccion_Hibrida(A,B, Nivel+1,k1,k2); %%%Recursividad la función se manda a llamar a si misma
        H=PiramideLaplaciana(B,Nivel);
        H=H+128*double(ones(size(H)));
        M=k1*double(imresize(uint8(Temp),[round(r/2^(Nivel-1)), round(c/2^(Nivel-1))],"cubic"))+k2*H;
    end
end
%% Piramide 2
function[M]=PiramideLaplaciana(A, Nivel)
    %L1=double(I)-double(imresize(Im1,[row, col],"cubic"));
    [row,col]=size(A);
    B=PiramideGaussiana(A, Nivel);
    M=double(PiramideGaussiana(A, Nivel-1))-double(imresize(B,[round(row/2^(Nivel-1)), round(col/2^(Nivel-1))],"cubic"));
end
%% Piramide
function[M]=PiramideGaussiana(A, Nivel)
    Kernel=VectorBinomialDerivate(5,0);
    Kernel=Kernel'*Kernel; 
    Kernel=Kernel/sum(Kernel,"all");%%Se obtiene el kernel
    [row,col]=size(A);
    for i=1:Nivel
        A=uint8(conv2(A,Kernel,"same"));
        A = imresize(A,[round(row/2^i), round(col/2^i)], "cubic") ;
    end
    M=A;
end
%% Función que permite obtener la enesima derivada
function [v] = VectorBinomialDerivate(L,d)%%L es la longitud del vector deseado
L1=L-d-1; %%% Se crea una nueva variable la cual corresponde al vector binomial que se deriva d veces
v=zeros(1,L1+1);
for i=0:L1
    v(i+1)=factorial(L1)/(factorial(L1-i)*factorial(i));
end %%%Creación del vector binomial 
for i=0:d-1
    v1 = [v 0];%%%%Derivación del vector d-1 veces
    v2 = [0 v];
    v = v1 - v2;
end
end