function[I]=Integrales_Multiples()
clc
format long
syms x y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=log(x+2*y);%función a calcular la integral
N=4;%número de particiones del eje x
M=2;%número de particiones del eje y
Inx=[1 1.5];%Intervalo del eje x
Iny=[1.4 2.0];
h(1)=(Inx(2)-Inx(1))/N;%longitud de las particiones del eje x 
h(2)=(Inx(2)-Inx(1))/M;%longitud de las particiones del eje y 
F=f;
f=matlabFunction(f);
xn=Inx(1):h(1):Inx(2);%nodos del eje x
yn=Iny(1):h(2):Iny(2);%nodos del eje y
I=Metodo(xn,yn,f,N,M);
end
function[I]=Metodo(xn,yn,f,N,M)
I=0;
for i=1:N
    for j=1:M
        if(mod(j,2)==0)
            I=I+4*f(xn(i),yn(j));
        else
            I=I+2*f(xn(i),yn(j));
        end
    end
end
end