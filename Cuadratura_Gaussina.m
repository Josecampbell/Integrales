function[]=Cuadratura_Gaussina()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Metodo de Gauss-Legendre-------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
format long
syms x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Entrada de Datos--------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=exp(-x^2);%función para calcular el area bajo la curva
f=matlabFunction(f);
a=1;%limite inferior de la integral
b=1.5;%limite superior de la integral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Parametros de Salidad---------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I es un vector con las cuadraturas Gaussianas con los polinomios de Legendre de grado 2
%grado 3 y grado 4
I=Gauss_Legendre(f,a,b);
fileID=fopen('Cuadratura_Gaussiana.txt','w');
fprintf(fileID,'\t %30s\t %30s\t%30s\n','Polinomio de Legendre de Grado 2 ','Polinomio de Legendre de Grado 3','Polinomio de Legendre de Grado 4');
fprintf(fileID,'%15s\t%12.8f','cuadratura',I);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------Metodo -----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]=Gauss_Legendre(f,a,b)
Gauss_traslacion=(b-a)/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Polinomio de Legendre Grado 2 -------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        coeficientes=[1,1];%coeficientes del polioniomo de Legendre de Grado 2
        raices=[0.5773502692,-0.5773502692]; %raices del Polinomio de Legendre de Grado 2
        xn=1/2*((b-a)*raices+a+b);%nodos a evaluar en la función
        yn=f(xn);%imagenes de los nodos
        I=Gauss_traslacion*(coeficientes*yn');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Polinomio de Legendre Grado 3 -------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
        coeficientes=[0.5555555556,0.8888888889,0.5555555556];%coeficientes del polioniomo de Legendre de Grado 3
        raices=[0.7745966692,0,-0.7745966692];%raices del Polinomio de Legendre de Grado 3
       xn=1/2*((b-a)*raices+a+b);%nodos a evaluar en la función
       yn=f(xn);%imagenes de los nodos
        I(2)=Gauss_traslacion*(coeficientes*yn');%valor de la cuadratura gaussiana
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------Polinomio de Legendre Grado 4 -------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        coeficientes=[0.3478548451,0.6521451549,0.6521451549,0.3478548451];%coeficientes del polioniomo de Legendre de Grado 4
         raices=[0.8611363116,0.3399810436,-0.3399810436,-0.8611363116];%raices del Polinomio de Legendre de Grado 4
       xn=1/2*((b-a)*raices+a+b);%nodos a evaluar en la función
       yn=f(xn);%imagenes de los nodos
        I(3)=Gauss_traslacion*(coeficientes*yn'); %valor de la cuadratura gaussiana

end