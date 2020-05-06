function[]=Monte_Carlo()
clc
format long
syms x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=x^2;%función para calcular el area bajo la curva
a=-1;%limite inferior de la integral
b=1;%limite superior de la integral
N=100;%Cantidad de Números aletorios
F=char(f);
f=matlabFunction(f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------llamada al Método--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[I,Inf,Sup,h,xn,yn]=Integral(a,b,f,N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------------------Parametrso de salidad----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es el valor aproximado de la integral por el Metodo de Monte carlos
%xn Números aletorios yn Imagenes de los Números 
%extremo infeiror del Intervalo de confianza del 95% de confianza
%extremo superior del Intervalo de confianza del 95% de confianza
%h longitud del intervalo de confianza
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Informe de Resultados-----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID=fopen('Monte Carlo.txt','w'); %nombre de el archivo txt llamado Monte Carlo
fprintf(fileID,'%10s\t %10s\t %10s\t %10s\t %20s\t %2s\n','f(x)','Lim Inf','Valor Aproximado','Lim Sup','longitud del intervalo','N');
fprintf(fileID,'%10s\t %f12.8\t %f12.8\t %f12.8\t %f12.8\t %d\n',F,Inf,I,Sup,h,N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Grafica de Resultados-----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
hold on;
scatter(xn,yn);
legend('aproximación de la Función f en el Intervalo [a,b]');hold off;
xlabel('eje x') %coamando xlabel para colocar nombre a el eje x
ylabel('eje y') %coamando label para colocar nombre a el eje y
title('Metodo de Monte Carlo')%el comando title para colocar nombre a las graficas
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Método------------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I,Inf,Sup,h,xn,yn]=Integral(a,b,f,N)
xn=a+(b-a)*rand(1,N);%Números aletorios 
yn=double(f(xn));%imagenes de los Números aletorios
I=(b-a)*mean(yn);%valor de la Integral
Inf=I-(1.96*std(yn))/sqrt(N);%extremo infeiror del Intervalo de confianza del 95% de confianza
Sup=I+(1.96*std(yn))/sqrt(N);%extremo Superior del Intervalo de confianza del 95% de confianza
h=Sup-Inf;%longitud del intervalo de confianza 
end

