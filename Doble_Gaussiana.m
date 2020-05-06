 function[I]=Doble_Gaussiana()
clc
format long
syms f(x,y) c(x) d(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f(x,y)=exp(y/x);%funci�n para calcular la integral
c(x)=x^3;%limite inferior del eje y
d(x)=x^2;%limite superior del eje y
a=0.1;%limite inferior del eje x
b=0.5;%limite inferior del eje x
n=5;%número de particiones del eje x
m=5;%número de particiones del eje y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------llamada al metodo-------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[I]=Gauss(a,b,c,d,f,m,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Parametros de salidad----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es valor de la integral doble de Gauss
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------- metodo -----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]=Gauss(a,b,c,d,f,m,n)
    load('Coeficientes_Legendre.mat')
    load('Raices_Legendre.mat')
    h(1)=(b-a)/2;
    h(2)=(b+a)/2;
    J=0;
     for i=1:m
         JX=0;
        xn=h(1)*Raices(m-1,i)+h(2); 
        d1=doble(d(xn));
        c1=double(c(xn));
        k(1)=(d1-c1)/2;
        k(2)=(d1+c1)/2;
        for j=1:n
            yn=k(1)*Raices(n-1,j)+k(2);
            Q=double(f(xn,yn));
            JX=JX+Coeficientes(n-1,j)*Q;
        end
        J=J+Coeficientes(m-1,i)*k(1)*JX;
    end
    I=h(1)*J;
end