%% Bow filter RGB components
% Filtering with RGB Images using different size of filters
n = 1;
for i = 1:5
    n = n+2;
    filtro = ones(n,n)/(n*n);
    if i ~= 2
        
        ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
        figure('Name', sprintf('Filtro Bloque1: %d x %d', n,n));
        imshow(ImFiltrada1(:,:,1))
        ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
        figure('Name', sprintf('Filtro Bloque Noise1: %d x %d', n,n));
        imshow(ImNoiseFiltrada1(:,:,1))

        ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
        figure('Name', sprintf('Filtro Bloque2: %d x %d', n,n));
        imshow(ImFiltrada2(:,:,2))
        ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
        figure('Name', sprintf('Filtro Bloque Noise2: %d x %d', n,n));
        imshow(ImNoiseFiltrada2(:,:,2))

        ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
        figure('Name', sprintf('Filtro Bloque3: %d x %d', n,n));
        imshow(ImFiltrada3(:,:,3))
        ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
        figure('Name', sprintf('Filtro Bloque Noise3: %d x %d', n,n));
        imshow(ImNoiseFiltrada3(:,:,3))
        
        ImFiltrada=ConvolucionRGB(Im,filtro);
        figure('Name', sprintf('Filtro Bloque: %d x %d', n,n));
        imshow(ImFiltrada)
        ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
        figure('Name', sprintf('Filtro Bloque Noise: %d x %d', n,n));
        imshow(ImNoiseFiltrada)

        ImFiltradaG=conv2(ImG,filtro,"same");
        figure('Name', sprintf('Filtro Bloque: %d x %d', n,n));
        imshow(ImFiltradaG)
        ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
        figure('Name', sprintf('Filtro Bloque Noise: %d x %d', n,n));
        imshow(ImNoiseFiltradaG)
    end   
end

%% Binomial Filter
n = 1;
for i = 1:5
    n = n+2;
    filtro=VectorBinomialDerivate(n,0);
    filtro=filtro'*filtro;
    filtro=filtro/sum(filtro, 'all');
    ImFiltradaG=conv2(ImG,filtro,"same");
    figure('Name', sprintf('Filtro Binomial ByN: %d x %d', n,n));
    imagesc(ImFiltradaG)
    colormap("gray")
    ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
    figure('Name', sprintf('Filtro Binomial Noise ByN: %d x %d', n,n));
    imagesc(ImNoiseFiltradaG)
    colormap("gray")   
end
%% Using the first derivate of a first order gaussian filter.
filtro = [1,-1]; 
ImFiltrada=ConvolucionRGB(Im,filtro);
figure('Name', sprintf('Bloque [1 -1]:RGB'));
imagesc(ImFiltrada.*1.8)
colormap("gray")
ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
figure('Name', sprintf('Bloque [1 -1] Noise: RGB'));
imagesc(ImNoiseFiltrada.*2)
colormap("gray")

%% Prewitt Filter edge detection in X direction
filtro=[1;1;1]*[1,0,-1];


ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
figure('Name', sprintf('Prewitt1 X'));
imagesc(ImFiltrada1(:,:,1))
colormap("gray")
ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
figure('Name', sprintf('Prewitt Noise1 X'));
imagesc(ImNoiseFiltrada1(:,:,1))
colormap("gray")

ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
figure('Name', sprintf('Prewitt2 X'));
imagesc(ImFiltrada2(:,:,2))
colormap("gray")
ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
figure('Name', sprintf('Prewitt Noise2 X'));
imagesc(ImNoiseFiltrada2(:,:,2))
colormap("gray")

ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
figure('Name', sprintf('Prewitt3 X'));
imagesc(ImFiltrada3(:,:,3))
colormap("gray")
ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
figure('Name', sprintf('Prewitt Noise3 X'));
imagesc(ImNoiseFiltrada3(:,:,3))
colormap("gray")
        
ImFiltrada=ConvolucionRGB(Im,filtro);
figure('Name', sprintf('Prewitt X:RGB'));
imagesc(ImFiltrada)
colormap("gray")
ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
figure('Name', sprintf('Prewitt Noise X: RGB'));
imagesc(ImNoiseFiltrada)
colormap("gray")

ImFiltradaG=conv2(ImG,filtro,"same");
figure('Name', sprintf('Prewitt X ByN'));
imagesc(ImFiltradaG)
colormap("gray")
ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
figure('Name', sprintf('Prewitt Noise X ByN'));
imagesc(ImNoiseFiltradaG)
colormap("gray")
%% Prewitt Filter edge detecion in Y direction
filtro=[1;0;-1]*[1,1,1];

ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
figure('Name', sprintf('Prewitt Y 1'));
imagesc(ImFiltrada1(:,:,1))
colormap("gray")
ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
figure('Name', sprintf('Prewitt Y Noise1'));
imagesc(ImNoiseFiltrada1(:,:,1))
colormap("gray")

ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
figure('Name', sprintf('Prewitt Y2:'));
imagesc(ImFiltrada2(:,:,2))
colormap("gray")
ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
figure('Name', sprintf('Prewitt Y Noise2'));
imagesc(ImNoiseFiltrada2(:,:,2))
colormap("gray")

ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
figure('Name', sprintf('Prewitt Y3'));
imagesc(ImFiltrada3(:,:,3))
colormap("gray")
ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
figure('Name', sprintf('Prewitt Y Noise3'));
imagesc(ImNoiseFiltrada3(:,:,3))
colormap("gray")
        
ImFiltrada=ConvolucionRGB(Im,filtro);
figure('Name', sprintf('Prewitt Y:RGB'));
imagesc(ImFiltrada.*1.8)
colormap("gray")
ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
figure('Name', sprintf('Prewitt Y Noise: RGB'));
imagesc(ImNoiseFiltrada.*2)
colormap("gray")

ImFiltradaG=conv2(ImG,filtro,"same");
figure('Name', sprintf('Prewitt Y ByN'));
imagesc(ImFiltradaG)
colormap("gray")
ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
figure('Name', sprintf('Prewitt Y ByN'));
imagesc(ImNoiseFiltradaG)
colormap("gray")

%% Sobel Filter edge detection in X direction
filtro=[1;2;1]*[1,0,-1];

ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
figure('Name', sprintf('Sobel X 1'));
imagesc(ImFiltrada1(:,:,1))
colormap("gray")
ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
figure('Name', sprintf('Sobel X Noise1'));
imagesc(ImNoiseFiltrada1(:,:,1))
colormap("gray")

ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
figure('Name', sprintf('Sobel X 2:'));
imagesc(ImFiltrada2(:,:,2))
colormap("gray")
ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
figure('Name', sprintf('Sobel X  Noise2'));
imagesc(ImNoiseFiltrada2(:,:,2))
colormap("gray")

ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
figure('Name', sprintf('Sobel X 3'));
imagesc(ImFiltrada3(:,:,3))
colormap("gray")
ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
figure('Name', sprintf('Sobel X Noise3'));
imagesc(ImNoiseFiltrada3(:,:,3))
colormap("gray")
        
ImFiltrada=ConvolucionRGB(Im,filtro);
figure('Name', sprintf('Sobel X :RGB'));
imagesc(ImFiltrada)
colormap("gray")
ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
figure('Name', sprintf('Sobel X Noise: RGB'));
imagesc(ImNoiseFiltrada)
colormap("gray")

ImFiltradaG=conv2(ImG,filtro,"same");
figure('Name', sprintf('Sobel X ByN'));
imagesc(ImFiltradaG)
colormap("gray")
ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
figure('Name', sprintf('Sobel X ByN'));
imagesc(ImNoiseFiltradaG)
colormap("gray")


%% Sobel filter edge direction in Y direction
SobelY =[1;0;-1]*[1,2,1];

ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
figure('Name', sprintf('Sobel Y 1'));
imagesc(ImFiltrada1(:,:,1))
colormap("gray")
ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
figure('Name', sprintf('Sobel Y Noise1'));
imagesc(ImNoiseFiltrada1(:,:,1))
colormap("gray")

ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
figure('Name', sprintf('Sobel Y 2:'));
imagesc(ImFiltrada2(:,:,2))
colormap("gray")
ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
figure('Name', sprintf('Sobel Y  Noise2'));
imagesc(ImNoiseFiltrada2(:,:,2))
colormap("gray")

ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
figure('Name', sprintf('Sobel Y 3'));
imagesc(ImFiltrada3(:,:,3))
colormap("gray")
ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
figure('Name', sprintf('Sobel Y Noise3'));
imagesc(ImNoiseFiltrada3(:,:,3))
colormap("gray")
        
ImFiltrada=ConvolucionRGB(Im,filtro);
figure('Name', sprintf('Sobel Y :RGB'));
imagesc(ImFiltrada)
colormap("gray")
ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
figure('Name', sprintf('Sobel Y Noise: RGB'));
imagesc(ImNoiseFiltrada)
colormap("gray")

ImFiltradaG=conv2(ImG,filtro,"same");
figure('Name', sprintf('Sobel Y ByN'));
imagesc(ImFiltradaG)
colormap("gray")
ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
figure('Name', sprintf('Sobel Y ByN'));
imagesc(ImNoiseFiltradaG)
colormap("gray")

%% Binomial Filter First derivative
n=5;
for i = 1:2
    if i ~= 3
        filtro2=VectorBinomialDerivate(n,1);
        filtro = filtro2'*VectorBinomialDerivate(n,0);
        
        ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada1: %d x %d', n,n));
        imagesc(ImFiltrada1(:,:,1))
        colormap("gray")
        ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada Noise1: %d x %d', n,n));
        imagesc(ImNoiseFiltrada1(:,:,1))
        colormap("gray")

        ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada2:: %d x %d', n,n));
        imagesc(ImFiltrada2(:,:,2))
        colormap("gray")
        ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada  Noise2: %d x %d', n,n));
        imagesc(ImNoiseFiltrada2(:,:,2))
        colormap("gray")

        ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada 3: %d x %d', n,n));
        imagesc(ImFiltrada3(:,:,3))
        colormap("gray")
        ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada Noise3: %d x %d', n,n));
        imagesc(ImNoiseFiltrada3(:,:,3))
        colormap("gray")
        
        ImFiltrada=ConvolucionRGB(Im,filtro);
        figure('Name', sprintf('Binomial 1ra derivada :RGB: %d x %d', n,n));
        imagesc(ImFiltrada.*1.8)
        colormap("gray")
        ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
        figure('Name', sprintf('Binomial 1ra derivada Noise: RGB: %d x %d', n,n));
        imagesc(ImNoiseFiltrada.*2)
        colormap("gray")

        ImFiltradaG=conv2(ImG,filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada ByN: %d x %d', n,n));
        imagesc(ImFiltradaG)
        colormap("gray")
        ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
        figure('Name', sprintf('Binomial 1ra derivada ByN: %d x %d', n,n));
        imagesc(ImNoiseFiltradaG)
        colormap("gray")
    end
    n = n+2;
end
%% Binomial Filter 1st derivative gray scale

n=3;
for i = 1:4
    n = n+2;
    filtro2=VectorBinomialDerivate(n,1);
    filt = filtro2'*VectorBinomialDerivate(n,0); %%%%%%%%%
    if i ~= 3
        ImFiltradaDB = conv2(double(rgb2gray(Im)),filt,"same");
        figure('Name', sprintf('Filtro Binomial, 1ra derivada: %d x %d', n,n));
        imshow(ImFiltradaDB,[])
        ImNoiseFiltradaDB = conv2(double(rgb2gray(Im)),filt,"same");
        figure('Name', sprintf('Filtro Binomial Ruido, 1ra derivada: %d x %d', n,n));
        imshow(ImNoiseFiltradaDB,[])
    end 
end

%% Laplacian Filter RGB

filtro=[-1,-1,-1;-1,8,-1;-1,-1,-1];

ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
figure('Name', sprintf('[-1 8 -1] 1'));
imagesc(ImFiltrada1(:,:,1))
colormap("gray")
ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
figure('Name', sprintf('[-1 8 -1] Noise1'));
imagesc(ImNoiseFiltrada1(:,:,1))
colormap("gray")

ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
figure('Name', sprintf('[-1 8 -1] 2:'));
imagesc(ImFiltrada2(:,:,2))
colormap("gray")
ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
figure('Name', sprintf('[-1 8 -1]  Noise2'));
imagesc(ImNoiseFiltrada2(:,:,2))
colormap("gray")

ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
figure('Name', sprintf('[-1 8 -1] 3'));
imagesc(ImFiltrada3(:,:,3))
colormap("gray")
ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
figure('Name', sprintf('[-1 8 -1] Noise3'));
imagesc(ImNoiseFiltrada3(:,:,3))
colormap("gray")
        
ImFiltrada=ConvolucionRGB(Im,filtro);
figure('Name', sprintf('[-1 8 -1] :RGB'));
imagesc(ImFiltrada)
colormap("gray")
ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
figure('Name', sprintf('[-1 8 -1] Noise: RGB'));
imagesc(ImNoiseFiltrada)
colormap("gray")

ImFiltradaG=conv2(ImG,filtro,"same");
figure('Name', sprintf('[-1 8 -1] ByN'));
imagesc(ImFiltradaG)
colormap("gray")
ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
figure('Name', sprintf('[-1 8 -1] ByN'));
imagesc(ImNoiseFiltradaG)
colormap("gray")

%% Laplacian 2nd derivative

filtro =[0,-1,0;-1,4,-1;0,-1,0];
ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
figure('Name', sprintf('[-1 8 -1] 1'));
imagesc(ImFiltrada1(:,:,1))
colormap("gray")
ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
figure('Name', sprintf('[-1 8 -1] Noise1'));
imagesc(ImNoiseFiltrada1(:,:,1))
colormap("gray")

ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
figure('Name', sprintf('[-1 8 -1] 2:'));
imagesc(ImFiltrada2(:,:,2))
colormap("gray")
ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
figure('Name', sprintf('[-1 8 -1]  Noise2'));
imagesc(ImNoiseFiltrada2(:,:,2))
colormap("gray")

ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
figure('Name', sprintf('[-1 8 -1] 3'));
imagesc(ImFiltrada3(:,:,3))
colormap("gray")
ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
figure('Name', sprintf('[-1 8 -1] Noise3'));
imagesc(ImNoiseFiltrada3(:,:,3))
colormap("gray")
        
ImFiltrada=ConvolucionRGB(Im,filtro);
figure('Name', sprintf('[-1 8 -1] :RGB'));
imagesc(ImFiltrada)
colormap("gray")
ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
figure('Name', sprintf('[-1 8 -1] Noise: RGB'));
imagesc(ImNoiseFiltrada)
colormap("gray")

ImFiltradaG=conv2(ImG,filtro,"same");
figure('Name', sprintf('[-1 8 -1] ByN'));
imagesc(ImFiltradaG)
colormap("gray")
ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
figure('Name', sprintf('[-1 8 -1] ByN'));
imagesc(ImNoiseFiltradaG)
colormap("gray")
%%
%Generate image with Noise
Laplac = [-1,-1,-1;-1,8,-1;-1,-1,-1];
Laplac2 = [0,-1,0;-1,4,-1;0,-1,0];
ImLaplac= conv2(double(rgb2gray(Im)),Laplac,"same");
ImLaplac2 = conv2(double(rgb2gray(Im)),Laplac2,"same");
figure('Name','Laplace -1 8 -1');
imshow(ImLaplac,[])
figure('Name','Laplace -1 4 -1');
imshow(ImLaplac2,[])
ImNoiseLaplac= conv2(double(rgb2gray(ImNoise)),Laplac,"same");
ImNoiseLaplac2 = conv2(double(rgb2gray(ImNoise)),Laplac2,"same");
figure('Name','Laplace -1 8 -1 Noise');
imshow(ImNoiseLaplac,[])
figure('Name','Laplace -1 4 -1 Noise');
imshow(ImNoiseLaplac2,[])
%% Creating Laplacian Filters
n=3;
for i = 1:4
    n = n+2;
    filtro2=VectorBinomialDerivate(n,2);
    filtrar = (filtro2'*VectorBinomialDerivate(n,0))+(VectorBinomialDerivate(n,0)'*filtro2);
    if i ~= 3
        filtro2=VectorBinomialDerivate(n,1);
        filtro = filtro2'*VectorBinomialDerivate(n,0);
        
        ImFiltrada1(:,:,1)=conv2(Im(:,:,1),filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano1: %d x %d', n,n));
        imagesc(ImFiltrada1(:,:,1))
        colormap("gray")
        ImNoiseFiltrada1(:,:,1)=conv2(ImNoise(:,:,1),filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano Noise1: %d x %d', n,n));
        imagesc(ImNoiseFiltrada1(:,:,1))
        colormap("gray")

        ImFiltrada2(:,:,2)=conv2(Im(:,:,2),filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano2:: %d x %d', n,n));
        imagesc(ImFiltrada2(:,:,2))
        colormap("gray")
        ImNoiseFiltrada2(:,:,2)=conv2(ImNoise(:,:,2),filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano  Noise2: %d x %d', n,n));
        imagesc(ImNoiseFiltrada2(:,:,2))
        colormap("gray")

        ImFiltrada3(:,:,3)=conv2(Im(:,:,3),filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano 3: %d x %d', n,n));
        imagesc(ImFiltrada3(:,:,3))
        colormap("gray")
        ImNoiseFiltrada3(:,:,3)=conv2(ImNoise(:,:,3),filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano Noise3: %d x %d', n,n));
        imagesc(ImNoiseFiltrada3(:,:,3))
        colormap("gray")
        
        ImFiltrada=ConvolucionRGB(Im,filtro);
        figure('Name', sprintf('2da derivada Laplaciano :RGB: %d x %d', n,n));
        imagesc(ImFiltrada.*1.8)
        colormap("gray")
        ImNoiseFiltrada=ConvolucionRGB(ImNoise,filtro);
        figure('Name', sprintf('2da derivada Laplaciano Noise: RGB: %d x %d', n,n));
        imagesc(ImNoiseFiltrada.*2)
        colormap("gray")

        ImFiltradaG=conv2(ImG,filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano ByN: %d x %d', n,n));
        imagesc(ImFiltradaG)
        colormap("gray")
        ImNoiseFiltradaG=conv2(ImNoiseG,filtro,"same");
        figure('Name', sprintf('2da derivada Laplaciano Noise ByN: %d x %d', n,n));
        imagesc(ImNoiseFiltradaG)
        colormap("gray")
    end
    
end

%% Unsharp masking
n = 5;
a=1.1;
filtro5x5 = ones(n,n)/(n*n);

Im5x5 = ConvolucionRGB(Im,filtro5x5);
ImNoi5x5 = ConvolucionRGB(ImNoise,filtro5x5);

Im5x5G = conv2(ImG,filtro5x5,"same");
ImNoi5x5G = conv2(ImNoiseG,filtro5x5,"same");

n=3;
for i = 1:2
%     unoCeros = [0,0,0;0,1,0;0,0,0];
% 
    filtro = -ones(n,n)/(n*n);
    filtro(round(n/2), round(n/2))=filtro(round(n/2), round(n/2))+1;
    filtro=filtro*a;
    filtro(round(n/2), round(n/2))=filtro(round(n/2), round(n/2))+1;
        
        ImFiltrada1(:,:,1)=conv2(Im5x5(:,:,1),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque1: %d x %d', n,n));
        imagesc(ImFiltrada1(:,:,1))
        colormap("gray")
        ImNoiseFiltrada1(:,:,1)=conv2(ImNoi5x5(:,:,1),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque Noise1: %d x %d', n,n));
        imagesc(ImNoiseFiltrada1(:,:,1))
        colormap("gray")

        ImFiltrada2(:,:,2)=conv2(Im5x5(:,:,2),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque2:: %d x %d', n,n));
        imagesc(ImFiltrada2(:,:,2))
        colormap("gray")
        ImNoiseFiltrada2(:,:,2)=conv2(ImNoi5x5(:,:,2),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque  Noise2: %d x %d', n,n));
        imagesc(ImNoiseFiltrada2(:,:,2))
        colormap("gray")

        ImFiltrada3(:,:,3)=conv2(Im5x5(:,:,3),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque 3: %d x %d', n,n));
        imagesc(ImFiltrada3(:,:,3))
        colormap("gray")
        ImNoiseFiltrada3(:,:,3)=conv2(ImNoi5x5(:,:,3),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque3: %d x %d', n,n));
        imagesc(ImNoiseFiltrada3(:,:,3))
        colormap("gray")
%         
        ImFiltrada=ConvolucionRGB(Im5x5,filtro);
        figure('Name', sprintf('Perfilado a filtro Bloque :RGB: %d x %d', n,n));
        imagesc(ImFiltrada.*1.8)
        colormap("gray")
        ImNoiseFiltrada=ConvolucionRGB(ImNoi5x5,filtro);
        figure('Name', sprintf('Perfilado a filtro Bloque Noise: RGB: %d x %d', n,n));
        imagesc(ImNoiseFiltrada.*1.8)
        colormap("gray")

        ImFiltradaG=conv2(Im5x5G,filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque ByN: %d x %d', n,n));
        imagesc(ImFiltradaG)
        colormap("gray")
        ImNoiseFiltradaG=conv2(ImNoi5x5G,filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Bloque Noise ByN: %d x %d', n,n));
        imagesc(ImNoiseFiltradaG)
        colormap("gray")
    n = n+4;
end
%% Box filter order 5
n = 5;
a=1.1;
filtro5x5 = ones(n,n)/(n*n);
Im5x5 = ConvolucionRGB(Im,filtro5x5);
figure
imshow(Im5x5)
ImNoi5x5 = ConvolucionRGB(ImNoise,filtro5x5);
n=3;
for i = 1:2
    filtro = -ones(n,n)/(n*n);
    filtro(round(n/2), round(n/2))=filtro(round(n/2), round(n/2))+1;
    filtro=filtro*a;
    filtro(round(n/2), round(n/2))=filtro(round(n/2), round(n/2))+1;
    ImFiltrada = ConvolucionRGB(Im5x5,filtro);
    figure('Name', sprintf('Filtro Bloque perfilado: %d x %d', n,n));
    imshow(ImFiltrada)
    ImNoiseFiltrada = ConvolucionRGB(ImNoi5x5,filtro);
    figure('Name', sprintf('Filtro Bloque perfilado Noise: %d x %d', n,n));
    imshow(ImNoiseFiltrada)
    n = n+4;
end
%% Binomial Filter order 5
n = 3;
a=1.1;
filtro5x5=VectorBinomialDerivate(5,0);
filtro5x5=filtro5x5'*filtro5x5;
filtro5x5=filtro5x5./sum(filtro5x5,'all');

Im5x5 = ConvolucionRGB(Im,filtro5x5);
ImNoi5x5 = ConvolucionRGB(ImNoise,filtro5x5);

Im5x5G = conv2(ImG,filtro5x5,"same");
ImNoi5x5G = conv2(ImNoiseG,filtro5x5,"same");

for i = 1:2
    filtro=VectorBinomialDerivate(n,0);
    filtro=filtro'*filtro;
    filtro=-filtro/sum(filtro,'all');
    filtro(round(n/2), round(n/2))=filtro(round(n/2), round(n/2))+1;
    filtro=filtro*a;
    filtro(round(n/2), round(n/2))=filtro(round(n/2), round(n/2))+1;
        
         ImFiltrada1(:,:,1)=conv2(Im5x5(:,:,1),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial1: %d x %d', n,n));
        imagesc(ImFiltrada1(:,:,1))
        colormap("gray")
        ImNoiseFiltrada1(:,:,1)=conv2(ImNoi5x5(:,:,1),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial Noise1: %d x %d', n,n));
        imagesc(ImNoiseFiltrada1(:,:,1))
        colormap("gray")

        ImFiltrada2(:,:,2)=conv2(Im5x5(:,:,2),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial2:: %d x %d', n,n));
        imagesc(ImFiltrada2(:,:,2))
        colormap("gray")
        ImNoiseFiltrada2(:,:,2)=conv2(ImNoi5x5(:,:,2),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial  Noise2: %d x %d', n,n));
        imagesc(ImNoiseFiltrada2(:,:,2))
        colormap("gray")

        ImFiltrada3(:,:,3)=conv2(Im5x5(:,:,3),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial 3: %d x %d', n,n));
        imagesc(ImFiltrada3(:,:,3))
        colormap("gray")
        ImNoiseFiltrada3(:,:,3)=conv2(ImNoi5x5(:,:,3),filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial3: %d x %d', n,n));
        imagesc(ImNoiseFiltrada3(:,:,3))
        colormap("gray")
        
        ImFiltrada=ConvolucionRGB(Im5x5,filtro);
        figure('Name', sprintf('Perfilado a filtro Binomial :RGB: %d x %d', n,n));
        imagesc(ImFiltrada.*1.8)
        colormap("gray")
        ImNoiseFiltrada=ConvolucionRGB(ImNoi5x5,filtro);
        figure('Name', sprintf('Perfilado a filtro Binomial Noise: RGB: %d x %d', n,n));
        imagesc(ImNoiseFiltrada.*1.8)
        colormap("gray")

        ImFiltradaG=conv2(Im5x5G,filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial ByN: %d x %d', n,n));
        imagesc(ImFiltradaG)
        colormap("gray")
        ImNoiseFiltradaG=conv2(ImNoi5x5G,filtro,"same");
        figure('Name', sprintf('Perfilado a filtro Binomial Noise ByN: %d x %d', n,n));
        imagesc(ImNoiseFiltradaG)
        colormap("gray")
    n = n+4;
end


%% Function to obtain the n derivative 
function [v] = VectorBinomialDerivate(L,d) % where L is the Lenght of the final vector
L1=L-d-1;
v=zeros(1,L1+1);
for i=0:L1
    v(i+1)=factorial(L1)/(factorial(L1-i)*factorial(i));
end 
for i=0:d-1
    v1=[v 0];
    v2=[0 v];
    v=v1-v2;
end
end
%%
function [M] = ConvolucionRGB(A,B)
    M=A; 
    M(:,:,1) = conv2(A(:,:,1),B,"same");% Convolution in each RGB component
    M(:,:,2) = conv2(A(:,:,2),B,"same");
    M(:,:,3) = conv2(A(:,:,3),B,"same");
end
