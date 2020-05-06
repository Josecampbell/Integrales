function[]=Metodo_Punto_Medio()
clc
format long
syms x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=1/(1+x);%función para calcular el area bajo la curva
a=0;%limite inferior de la integral
b=1;%limite superior de la integral
N=10;%Número de particiones del intervalo
h=(b-a)/N;%longitud de las particiones
F=f;
f=matlabFunction(f);
xn=a:h:b;%nodos de las particiones 
I=Punto_Medio(f,xn,h);%llamada al metodo de Punto Medio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Parametros de salida----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es el valor de la integral en el intervalo [a,b] 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------Grafica--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
PM=(xn(1:length(xn)-1)+xn(2:length(xn)))/2;%puntos Medios de los subintervalos
hold on;fplot(f,[a,b],'MarkerEdgeColor','r');%grafica de la funcion
for i=1:length(PM)
    rectangle('Position',[xn(i) 0 h f(xn(i))]); %Este comando crea rectangulos con vertice de (xn(i),0), anchura 'h' unidades y altura f(xn(i))
    punto_medio=line([PM(i),PM(i)],[0,f(PM(i))]);
    % punto_medio.color='green';
    punto_medio.LineStyle = '--';
    
end
line([a,b],[0,0]);legend('función','Puntos Medios' );hold off
xlabel('eje x') %coamando xlabel para colocar nombre a el eje x
ylabel('eje y') %coamando label para colocar nombre a el eje y
title('Representación grafica de la Integral')%el comando title para colocar nombre a las graficas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Informe de los resultados ----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID=fopen('Punto Medio.txt','w'); %nombre de el archivo txt llamado Punto Medio
fprintf(fileID,'%5s %5s %5s %5s %5s\n','f(x)','h','a','b','Valor Aproximado');
fprintf(fileID,'%5s %12.8f %12.8f %12.8f %12.8f',char(F),h,a,b,I);

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------- Metodo ----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]=Punto_Medio(f,xn,h)
I=0;
for i=2:length(xn)
    I=I+f((xn(i-1)+xn(i))/2); %metodo íterativo del punto Medio
end
I=h*I;
end