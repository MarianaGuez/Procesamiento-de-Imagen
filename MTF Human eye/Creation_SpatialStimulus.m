longitud_x =512;
periodo_inicial = 300;
img=zeros(longitud_x,longitud_x);

k3=0.015;
k2 = log(0.22*periodo_inicial)/longitud_x;
k1 = (2*pi)/(periodo_inicial*k2);

for x=1:longitud_x
    for y=1:longitud_x
        img(y,x)=0.4-sin(k1*exp(k2*x))*exp(-k3*(longitud_x-y));
    end
end


imwrite(img,'practica1.JPG','jpg','quality',100);   
