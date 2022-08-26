imgNegra = zeros(1500,1500);

for col = 1:1500
    for row = 1:1500
        imgNegra(row,col) = (chirp(col*0.001,0.8,1,25,'logarithmic')*(1-exp(-row*0.001)));
    end
end

figure(2)
imagesc(imgNegra)
colormap("gray")


