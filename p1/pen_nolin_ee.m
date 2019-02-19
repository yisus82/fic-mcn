function Z=pen_nolin_ee(l,k,g,t0,v0,N,b,h)
z1(1)=t0
z2(1)=v0
Z=[z1; z2]
puntos=[0:h:b];
num_puntos=length(puntos);
for I = 2:num_puntos
    f1(I-1)=z2(I-1);
    f2(I-1)=(1/l)*(-g*sin(z1(I-1))-k*z2(I-1));
    z1(I)=z1(I-1)+h*f1(I-1);
    z2(I)=z2(I-1)+h*f2(I-1);
end
Z=[z1 ; z2]
end