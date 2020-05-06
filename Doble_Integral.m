function[I]=Doble_Integral()
clc
format long
syms x y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=x^2+y^3;%funci�n para calcular la integral
c=x;%limite inferior del eje y
d=2*x;%limite superior del eje y
a=0;%limite inferior del eje x
b=1;%limite superior del eje x
n=4;%número de particiones del eje x
m=8 ;%número de particiones del eje y
f=matlabFunction(f);
c=matlabFunction(c);
d=matlabFunction(d);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------llamada al metodo-------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=simpson_Doble(a,b,c,d,f,m,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Parametros de salida-----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es resultado de la Integral doble de la superficie f
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------metodo de simpson para Integrales dobles------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]=simpson_Doble(a,b,c,d,f,m,n)
h=(b-a)/n;%longitud de las particiones del eje x
J(1)=0;%Terminos de los extremos del eje x
J(2)=0;%Ternminos pares del eje x
J(3)=0;%Terminos impares del eje x
for i=0:n
xn=a+i*h;%nodos del eje x
hy=(d(xn)-c(xn))/m;%longitud de las particiones del eje y
K(1)=f(xn,c(xn))+f(xn,d(xn));%Terminos de los extremos del eje y
K(2)=0;%Ternminos pares del eje y
K(3)=0;%Terminos impares del eje y
        for j=1:m-1
            yn=c(xn)+j*hy;
            Q=f(xn,yn);
            if(mod(j,2)==0)
                K(2)=K(2)+Q;
            else
                K(3)=K(3)+Q;
            end
        end
        L=(K(1)+2*K(2)+4*K(3))*hy/3;
        if(i==0 || i==n)
            J(1)=J(1)+L;
        else
            if(mod(i,2)==0)
                J(2)=J(2)+L;
            else
                 J(3)=J(3)+L;
            end
        end
end
I=(J(1)+2*J(2)+4*J(3))*h/3;%resultado de la integral doble
end