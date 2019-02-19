clear all

disp(' ')
disp('Practica 2 de Metodos de Calculo Numerico')
disp(' ')
disp('Problema termico')
disp(' ')
N = input('Introduce el numero de puntos: ')
h = 1/(N+1)
puntos = [0:h:1];
g = input('Introduce el flujo de calor en 0: ')
beta = input('Introduce la temperatura en 1: ')
disp('Introduce la funcion a(x)=lx^2+kx+g')
la = input('Introduce el valor de l: ')
ka = input('Introduce el valor de k: ')
ga = input('Introduce el valor de g: ') 
a = la*puntos.^2+ka*puntos+ga;
disp(' ')
disp('Introduce la funcion f(x)=lx^2+kx+g')
lf = input('Introduce el valor de l: ')
kf = input('Introduce el valor de k: ')
gf = input('Introduce el valor de g: ') 
f = lf*puntos.^2+kf*puntos+gf;

%Superdiagonal de Ah
Ah1 = zeros(N+1,1);
%Diagonal de Ah
Ah2 = zeros(N+2,1);
%Subdiagonal de Ah
Ah3 = zeros(N+1,1);

bh = zeros(N+2,1);

for i=0:N
	%Metodo de trapecio
	Ahk=(1/(2*(puntos(i+2)-puntos(i+1))))*((a(i+1)*[1 -1;-1 1])+(a(i+2)*[1 -1;-1 1]));
	%Metodo de trapecio
	bhk=((puntos(i+2)-puntos(i+1))/2)*[f(i+1) f(i+2)];

	%Ensamblado de Ah
	Ah1(i+1)=Ahk(1,2);
	Ah2(i+1)=Ah2(i+1)+Ahk(1,1);
	Ah2(i+2)=Ahk(2,2);
	Ah3(i+1)=Ahk(2,1);

	%Ensamblado de bh
	bh(i+1)= bh(i+1)+bhk(1);
	bh(i+2)=bhk(2);
end

%Bloqueo en 1
Ah2(N+2)=10^30;
bh(N+2)=beta*(10^30);

%Condicion inicial en 0
bh(1)=bh(1)+g;

%Factorizacion LU tridiagonal
alfas = zeros(N+2,1);
betas = zeros(N+1,1);
as = Ah2;
bs = Ah3;
cs = Ah1;
y = zeros(N+2,1);
Uh = zeros(N+2,1);

alfas(1)=Ah2(1);

for i=2:N+2
	betas(i-1) = (bs(i-1))/(alfas(i-1));
	alfas(i) = as(i)-betas(i-1)*cs(i-1);
end

y(1) = bh(1);

for i=2:N+2
	y(i) = bh(i)-betas(i-1)*y(i-1);
end

Uh(N+2)=(y(N+2))/(alfas(N+2));

for i=N+2:-1:2
	Uh(i-1)=(y(i-1)-cs(i-1)*Uh(i))/alfas(i-1);
end

figure;
plot(puntos,Uh);
title('Temperatura aproximada');
