function[]=Multivariable_Monte_carlo()
clc
format long
syms x y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ix=[0 1];%limites de integración del eje x
Iy=[0 1];%limites de integración del eje y
N=1000;%Cantidad de Números aletorios
f=exp((x+y)^2);%función a Integrar
F=char(f);
f=matlabFunction(f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------LLamada a el Metodo-----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[I,Inf,Sup,h,xn,yn,zn]=Monte_Carlo(f,Ix,Iy,N);
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
fileID=fopen('Monte Carlo Doble.txt','w'); %nombre de el archivo txt llamado Monte Carlo
fprintf(fileID,'%10s\t %10s\t %10s\t %10s\t %20s\t %2s\n','f(x)','Lim Inf','Valor Aproximado','Lim Sup','longitud del intervalo','N');
fprintf(fileID,'%10s\t %f12.8\t %f12.8\t %f12.8\t %f12.8\t %d\n',F,Inf,I,Sup,h,N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Grafica de Resultados-----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
scatter3(xn,yn,zn);
legend('aproximación de la Función f ');
xlabel('eje x') %coamando xlabel para colocar nombre a el eje x
ylabel('eje y') %coamando label para colocar nombre a el eje y
zlabel('eje z') %coamando label para colocar nombre a el eje z
title('Metodo de Monte Carlo')%el comando title para colocar nombre a las graficas
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Metodo de Monte carlo---------------------------%
%-------------------Para Integrales Doble------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I,Inf,Sup,h,xn,yn,zn]=Monte_Carlo(f,Ix,Iy,N)
xn=Ix(1)+(Ix(2)-Ix(1))*rand(1,N);%Números aletorios del eje x
yn=Iy(1)+(Iy(2)-Iy(1))*rand(1,N);%Números aletorios del eje y
zn=f(xn,yn);%Imagenes de los Números aletorios
I=(Ix(2)-Ix(1))*(Iy(2)-Iy(1))*mean(zn);%calculo de la Integral
Inf=I-(1.96*std(yn))/sqrt(N);%extremo infeiror del Intervalo de confianza del 95% de confianza
Sup=I+(1.96*std(yn))/sqrt(N);%extremo Superior del Intervalo de confianza del 95% de confianza
h=Sup-Inf;%longitud del intervalo de confianza 
end