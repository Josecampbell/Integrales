 function[]=Metodo_trapecio()
clc
format long
syms x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=sin(x);%función para calcular el area bajo la curva
a=0;%limite inferior de la integral
b=2*pi;%limite superior de la integral
N=10;%Número de  particiones del intervalo
h=(b-a)/N;%longitud de las particiones
F=f;
f=matlabFunction(f);
xn=a:h:b;%nodos de las particiones
I=trapecio(f,xn,h);%llamada al metodo de salida
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Parametros de salida----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es el valor de la integral en el intervalo [a,b]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------Grafica--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
hold on;fplot(f,[a,b],'MarkerEdgeColor','r');%grafica de la funcion
for i=1:length(xn)
    %construyendo los trapecios de los subintervalos
    line([xn(i),xn(i)],[0,f(xn(i))],'MarkerEdgeColor','b');
    if(i<length(xn))
        line([xn(i),xn(i+1)],[f(xn(i)),f(xn(i+1))],'MarkerEdgeColor','b')
    end
end
line([a,b],[0,0]);legend('función','trapecios','recta y=0');hold off
xlabel('eje x') %coamando xlabel para colocar nombre a el eje x
ylabel('eje y') %coamando label para colocar nombre a el eje y
title('Representación grafica de la Integral')%el comando title para colocar nombre a las graficas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Informe de los resultados ----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID=fopen('Trapecio.txt','w'); %nombre de el archivo txt llamado Trapecio
fprintf(fileID,'%5s %5s %5s %5s %5s\n','f(x)','h','a','b','Valor Aproximado');
fprintf(fileID,'%5s %12.8f %12.8f %12.8f %12.8f',char(F),h,a,b,I);

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------- Metodo----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]=trapecio(f,xn,h)
I=f(xn(1))+f(xn(length(xn)));

for i=2:length(xn)-1
    I=I+2*f(xn(i));
end

I=h/2*I;

end