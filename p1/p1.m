clear all
disp('Practica 1 de MCN')
disp('')
disp('1. Pendulo lineal solucion exacta')
disp('2. Pendulo lineal euler explicito')
disp('3. Pendulo lineal metodo trapecio')
disp('4. Pendulo no lineal euler explicito')
disp('5. Comprobacion no lineal tiende a lineal')
disp('')
opcion = input('Elige una opcion: ')
if (opcion==1)
    disp('')
    disp('ly''''+ky''+gy=0, y(0)=y0, y''(0)=y''0')
    disp('')
    l=input('Introduce el valor de l: ')
    k=input('Introduce el valor de k: ')
    g=input('Introduce el valor de g: ')
    t0=input('Introduce el valor de y0: ')
    v0=input('Introduce el valor de y''0: ')
    N=input('Introduce el numero de puntos en que toma valores la funcion y: ')
    b=input('Introduce el extremo final del intervalo: ');
    h=b/(N+1);
    puntos=[0:h:b];
    x=pen_lin_ex(l,k,g,t0,v0,N,b);
    figure;
    plot(puntos,x);
    title('Pendulo lineal solucion exacta');
elseif(opcion==2)
    disp('')
    disp('ly''''+ky''+gy=0, y(0)=y0, y''(0)=y''0')
    disp('')
    l=input('Introduce el valor de l: ')
    k=input('Introduce el valor de k: ')
    g=input('Introduce el valor de g: ')
    t0=input('Introduce el valor de y0: ')
    v0=input('Introduce el valor de y''0: ')
    N=input('Introduce el numero de puntos en que toma valores la funcion y: ')
    b=input('Introduce el extremo final del intervalo: ');
    h=b/(N+1);
    puntos=[0:h:b];
    Z=pen_lin_ee(l,k,g,t0,v0,N,b,h);
    figure;
    plot(puntos,Z(1,:));
    title('Pendulo lineal euler explicito');
elseif(opcion==3)
    disp('')
    disp('ly''''+ky''+gy=0, y(0)=y0, y''(0)=y''0')
    disp('')
    l=input('Introduce el valor de l: ')
    k=input('Introduce el valor de k: ')
    g=input('Introduce el valor de g: ')
    t0=input('Introduce el valor de y0: ')
    v0=input('Introduce el valor de y''0: ')
    N=input('Introduce el numero de puntos en que toma valores la funcion y: ')
    b=input('Introduce el extremo final del intervalo: ');
    h=b/(N+1);
    puntos=[0:h:b];
    Z=pen_lin_trap(l,k,g,t0,v0,N,b,h);
    figure;
    plot(puntos,Z(1,:));
    title('Pendulo lineal metodo trapecio');
elseif(opcion==4)
    disp('')
    disp('ly''''+ky''+gsen(y)=0, y(0)=y0, y''(0)=y''0')
    disp('')
    l=input('Introduce el valor de l: ')
    k=input('Introduce el valor de k: ')
    g=input('Introduce el valor de g: ')
    t0=input('Introduce el valor de y0: ')
    v0=input('Introduce el valor de y''0: ')
    N=input('Introduce el numero de puntos en que toma valores la funcion y: ')
    b=input('Introduce el extremo final del intervalo: ');
    h=b/(N+1);
    puntos=[0:h:b];
    Z=pen_nolin_ee(l,k,g,t0,v0,N,b,h);
    figure;
    plot(puntos,Z(1,:));
    title('Pendulo no lineal euler explicito');
else
    disp('')
    l=input('Introduce el valor de l: ')
    k=input('Introduce el valor de k: ')
    g=input('Introduce el valor de g: ')
    t0=input('Introduce el valor de y0: ')
    v0=input('Introduce el valor de y''0: ')
    N=input('Introduce el numero de puntos en que toma valores la funcion y: ')
    b=input('Introduce el extremo final del intervalo: ');
    h=b/(N+1);
    puntos=[0:h:b];
    Z1=pen_lin_ee(l,k,g,t0,v0,N,b,h);
    Z2=pen_nolin_ee(l,k,g,t0,v0,N,b,h);
    figure;
    plot(puntos,Z1(1,:),'r');
    hold on;
    plot(puntos,Z2(1,:),'b');
    hold off;
    title('Solucion lineal en rojo y solucion no lineal en azul');
end