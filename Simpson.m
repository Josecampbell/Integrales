function[]=Simpson()
%clc
format long
syms x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------   INPUT   ------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% example (a)
f=4/(1+x*x); %%function to integrate
%% example (b)
%f=sqrt(x) %%function to integrate
figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0;%lower limit
b=1;%Upper limit
N=20;%number of subintervals
h=(b-a)/N;%step integration (this make the subintervals uniform)
F=f;
f=matlabFunction(f);
xn=a:h:b;%%partition nodes 
I=Simsomp(f,xn,h);%%calling the method

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=parable(xn,f,N);
% this function constructs a curve interpolated with the nodes xn 
% through polynomials of second order
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------output parameters----------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I: value of integral on [a,b]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------  Graphics  --------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%close all
hold on;fplot(f,[a,b],'MarkerEdgeColor','r');%
for i=1:length(P)
     p=P(i);
     k=2*i;
    p=matlabFunction(p);
   plot(xn(k-1:k+1),p(xn(k-1:k+1)));line([xn(k-1),xn(k-1)],[0,f(xn(k-1))]);line([xn(k+1),xn(k+1)],[0,f(xn(k+1))]);
end
line([a,b],[0,0]);legend('function','interpolating curve','partitions','line y=0', ['Value of the integral=' num2str(I)]);
%hold off
xlabel('axes x') 
ylabel('axes y') 
title('Simpson: graphic representation of the integral')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------RESULTS ----------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Error=abs(I-double(int(F,a,b)));
fileID=fopen('Simpson.txt','w'); %nombre de el archivo txt llamado Simsomp
fprintf(fileID,'%5s\t \t %5s\t \t %5s\t \t %5s\t \t %5s\t \t %15s\n','f(x)','h','a','b','Valor Aproximado','Error');
fprintf(fileID,'%5s\t %12.8f\t %12.8f\t %12.8f\t %12.8f\t %12.8f\n',char(F),h,a,b,I,Error);

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------METHOD-----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]=Simsomp(f,xn,h)
I=f(xn(1))+f(xn(length(xn))); 
I1=0; I2=0;
for i=2:length(xn)-1
    if(mod(i,2)==0)
         I1=I1+f(xn(i));
    else          
         I2=I2+f(xn(i));
    end
end
%
I=h*(I+4*I1+2*I2)/3;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------interpolating polynomials -----------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[P]=parable(xn,f,N)
syms x
n=N/2;%number of polynomials of degree 2 to be generated
P=sym(zeros(1,n));
for i=1:n
    k=2*i;
   xk=xn(k-1:k+1);
   yk=f(xk);
   coef=polyfit(xk,yk,2);
   P(i)=coef(1)*x^2+coef(2)*x+coef(3);
end

end


