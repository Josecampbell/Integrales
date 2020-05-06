function[I]=Integrales_Dobles()
clc
format long
syms x y 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ix=[1.4 2];%limites de integración del eje x
Iy=[1 1.5];%limites de integración del eje y
Nx=4;%números de particiones del eje x
Ny=2;%números de particiones del eje  
f=log(x+2*y);%función para calcular el area
f=matlabFunction(f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------LLamada a el Metodo-----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=simsonp(f,Ix,Iy,Nx,Ny);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------------------Parametrso de salidad---------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es el valor aproximado de la integral Doble usando el metodo de simpson
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Metodo------------------------------------------%
%-------------------Para Integrales Dobles------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[I]=simsonp(f,Ix,Iy,Nx,Ny)
h(1)=(Ix(2)-Ix(1))/Nx;
h(2)=(Iy(2)-Iy(1))/Ny;
xn=Ix(1):h(1):Ix(2);%nodos del eje x
yn=Iy(1):h(2):Iy(2);%nodos del eje y
xw=1;
for i=2:length(xn)-1
    if(mod(i,2)==0)
        xw(i)=4;%coeficientes del metodo de simpson sobre el eje x 
    else
        xw(i)=2;
    end
end
xw(length(xn))=1;
yw=1;
for i=2:length(yn)-1
    if(mod(i,2)==0)
        yw(i)=4;%coeficientes del metodo de simpson sobre el eje y 
    else
        yw(i)=2;
    end
end
yw(length(yn))=1;
%matriz de coeficientes del metodo de Integracion doble
for j=1:length(yn)
A(j,:)=xw*yw(j);    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------calculo de la Integral----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=0;
for j=1:length(yn)
F(j,:)=f(xn,yn(j));%Imagenes de la función en la fila j
I=I+F(j,:)*A(j,:)';
end
I=prod(h)*I/9;
end

