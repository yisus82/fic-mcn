function Z=pen_lin_trap(l,k,g,t0,v0,N,b,h)
z1(1)=t0
z2(1)=v0
Z=[z1; z2]
puntos=[0:h:b];
num_puntos=length(puntos);
for I = 2:num_puntos
%    zk=inv( [1 -(1/2); (g/2*l)  1+(k/2*l)]) * ([1 1/2; -(g/2*l) 1-(k/2*l)]) * [z1(I-1) z2(I-1)]'
%    pause;
%    z1(I)=zk(1);
%    z2(I)=zk(2);
z2(I)=((1-((h*k)/2*l)-((g*h^2)/4*l))*z2(I-1)-(((h*g)/2*l)+((g*h)/2*l))*z1(I-1))/(1+((k*h)/2*l)+((g*h^2)/4*l));
z1(I)=z1(I-1)+(h/2)*(z2(I-1)+z2(I));
end
Z=[z1 ; z2]
end