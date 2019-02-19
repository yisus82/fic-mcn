function x =pen_lin_ex(l,k,g,t0,v0,N,b)
h=b/(N+1);
puntos=[0:h:b];
num_puntos=length(puntos);
x(1)=0;
if (k==0)
    r1=sqrt(-g/l)
    r2=-sqrt(-g/l)
    c1=t0
    c2=v0/sqrt(g/l)
    w0=sqrt(g/l)
    R=sqrt(c1^2+c2^2)
    if (c1==0)
        if (c2==0)
            x=0
        end
    else 
        phi=acos(c1/sqrt(c1^2+c2^2))
        for I = 2:num_puntos
            x(I)=R*(cos(w0*puntos(I)-phi));
        end
    end
elseif (k^2==4*g*l)
    r=(-k/2*l)
    c1=t0
    c2=v0+(k/2*l)*c1
    for I = 2:num_puntos
        x(I)=c1*exp(r*puntos(I))+c2*puntos(I)*exp(r*puntos(I));
    end
elseif (k^2>4*g*l) 
    r1=(-k+sqrt(k^2-4*g*l))/(2*l)
    r2=(-k-sqrt(k^2-4*g*l))/(2*l)
    c2=(v0-r1*t0)/(r2-r1)
    c1=t0-c2
    for I = 2:num_puntos
        x(I)=c1*exp(r1*puntos(I))+c2*exp(r2*puntos(I));
    end
else
    r1=(-k+sqrt(k^2-4*g*l))/(2*l)
    r2=(-k-sqrt(k^2-4*g*l))/(2*l)
    c1=t0
    c2=(v0*2*l+k*t0)/sqrt(4*l*g-k^2)
    w0=sqrt(4*l*g-k^2)/(2*l)
    R=sqrt(c1^2+c2^2)
    if (c1==0)
        if (c2==0)
            x=0
        end
    else 
        phi=acos(c1/sqrt(c1^2+c2^2))
        for I = 2:num_puntos
            x(I)=R*exp((-k*puntos(I))/(2*l))*cos(w0*puntos(I)-phi);
        end
    end
end