function[APP]=Cuadratura_adaptativa()
clc
format long
syms x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=100/x^2*sin(10/x);%funcion a estudiar
f=matlabFunction(f);
a=1;%extremo inferior del intervalo
b=3;%extremo superior del intervalo
N=4;%limites
tol=0.00001;%tolerancia definidad 
[APP,a,fa]=Metodo(a,b,N,tol,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------- Grafica ----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
hold on;fplot(f,[a(1)-1,a(length(a))+1],'MarkerEdgeColor','r');scatter(a,fa); hold off
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------- Metodo ----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[APP,a,fa]=Metodo(a,b,N,tol,f)
i=1;
APP=0;
tol(i)=10*tol;
a(i)=a;
h(i)=(b-a)/2;
fa(i)=f(a);
fc(i)=f(a+h);
fb(i)=f(b);
S(i)=h(i)*(fa+4*fc+fb)/3;
L(i)=1;
while(i>0)
fd=f(a(i)+h(i)/2);
fe=f(a(i)+3*h(i)/2);
S1=h(i)*(fa(i)+4*fd+fc(i))/6;
S2=h(i)*(fc(i)+4*fe+fb(i))/6;
v1=a(i);
v2=fa(i);
v3=fc(i);
v4=fb(i);
v5=h(i);
v6=tol(i);
v7=S(i);
v8=L(i);
i=i-1;
    if(abs(S1+S2-v7)<v6)
        APP=APP+(S1+S2);
    else
        if(v8>=N)
            fprintf('error:Número insuficiente de intervalos\n')
            return;
        else
            i=i+1;
            a(i)=v1+v5;
            fa(i)=v3;
            fc(i)=fe;
            fb(i)=v4;
            h(i)=v5/2;
            tol(i)=v6/2;
            S(i)=S2;
            L(i)=v8+1;
            i=i+1;
            a(i)=v1;
            fa(i)=v2;
            fc(i)=fd;
            fb(i)=v3;
            h(i)=h(i-1);
            tol(i)=tol(i-1);
            S(i)=S1;
            L(i)=L(i-1);
        end
    end
end

end