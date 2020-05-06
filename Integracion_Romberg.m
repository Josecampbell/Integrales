function[]=Integracion_Romberg()
clc
format long
syms x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=(1+x)/(6-x);%función para calcular el area bajo la curva
a=0;%limite inferior de la integral
b=2;%limite superior de la integral
N=10;%Número de particiones del intervalo
f=matlabFunction(f);
R=Romberg(a,b,N,f);%llamada al metodo de Romberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Parametros de salida----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R es una matriz cuyas entradas son Iteraciones optenidas del Método de Romberg
[fila,columna]=size(R);
denominador=1;
fileID=fopen('Romberg.txt','w'); %nombre de el archivo txt llamado Romberg
fprintf(fileID,'Resultados\n');
for i=1:fila
    denominador=2*denominador;
    fprintf(fileID,'N(h/%d)',denominador);
    for j=1:columna
        fprintf(fileID,' %f ',R(i,j));%Cuadro comparativo de las Iteraciones Reviisar tabla 4.10 Burden
    end
    fprintf(fileID,'\n');
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Metodo-----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[R]=Romberg(a,b,N,f)
h=b-a;%longitud del íntervalo
R(1,1)=h/2*(f(a)+f(b));
for i=2:N
k=1:2^(i-2);
k=a+(k-0.5)*h;
fk=f(k);
   R(i,1)=1/2*(R(i-1,1)+h*sum(fk));
   for j=2:i
       R(i,j)=R(i,j-1)+(R(i,j-1)-R(i-1,j-1))/(4^(j-1)-1);
   end
   h=h/2;
end
 
end


