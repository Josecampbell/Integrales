function[I]=Integral_Triple()
clc
format long
syms x y z 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F=exp(x+y+z);%superficie a calcular la integral
a=0;%liimite superior del eje x
b=1;%limite inferior del eje x
c=1;%liimite superior del eje y
d=2;%limite inferior del eje y
e=0;%liimite superior del eje z
f=0.5;%limite inferior del eje z
m=5;%n�mero de particiones del eje x
n=5;%n�mero de particiones del eje y
p=5;%n�mero de particiones del eje z
F=matlabFunction(F);
%c=matlabFunction(c);
%d=matlabFunction(d);
%e=matlabFunction(e);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------llamada al metodo--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=Gauss_Triple(F,a,b,c,d,e,f,m,n,p);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------parametros de salida-------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es el resultado de la Integral triple gaussiana
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------- metodo------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]=Gauss_Triple(F,a,b,c,d,e,f,m,n,p)
load('Coeficientes_Legendre.mat')
load('Raices_Legendre.mat')
h(1)=(b-a)/2;
h(2)=(b+a)/2;
J=0;
    for i=1:m
        JX=0;
        xn=h(1)*Raices(m-1,i)+h(2);
        d1=d;
        c1=c;
        k(1)=(d1-c1)/2;
        k(2)=(d1+c1)/2;
        for j=1:n
            JY=0;
            yn=k(1)*Raices(n-1,j)+k(2);
            e1=e;
            f1=f;
            l(1)=(f1-e1)/2;
            l(2)=(f1+e1)/2;
            for t=1:p
                zn=l(1)*Raices(p-1,t)+l(2);
                Q=F(xn,yn,zn);
                JY=JY+Coeficientes(p-1,t)*Q;
            end
            JX=JX+Coeficientes(n-1,j)*l(1)*JY;
        end
        J=J+Coeficientes(m-1,i)*k(1)*JX;
    end
    I=h(1)*J;
end