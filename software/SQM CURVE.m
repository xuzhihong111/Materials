N=100;% THE WHOLE LENGTH
f=0:(N-1);
f_p=N-f-1;
R1=N-f;
R11=R1.*cos(2*pi*f/N);
a=1/6;b=-(3*N*N+3*N+1)/6;c=(2*N*N*N+3*N*N+N)/6;
R2=(a*(f.*f.*f)+b*f+c)/c;
R21=R2.*cos(2*pi*f/N);
s01=f_p+1;
s11=f_p.*f_p/2+f_p/2;
s21=(2*(f_p.*f_p.*f_p)+3*(f_p.*f_p)+f_p)/6;
s31=(f_p.*f_p.*f_p.*f_p+2*f_p.*f_p.*f_p+f_p.*f_p)/4;
s41=f_p.*f_p.*f_p.*f_p.*f_p/5+f_p.*f_p.*f_p.*f_p/2+f_p.*f_p.*f_p/3-f_p/30;
s51=f_p.*f_p.*f_p.*f_p.*f_p.*f_p/6+f_p.*f_p.*f_p.*f_p.*f_p/2+5*f_p.*f_p.*f_p.*f_p/12-f_p.*f_p/12;
s61=f_p.*f_p.*f_p.*f_p.*f_p.*f_p.*f_p/7+f_p.*f_p.*f_p.*f_p.*f_p.*f_p/2+f_p.*f_p.*f_p.*f_p.*f_p/2-f_p.*f_p.*f_p/6+f_p/42;
R3=a*a*s61+3*a*a*f.*s51+(2*a*b+3*a*a*f.*f).*s41+(2*a*c+4*a*b*f+a*a*f.*f.*f).*s31+(b*b+3*a*c*f+3*a*b*f.*f).*s21+(3*a*c*f.*f+a*b*f.*f.*f+2*b*c+b*b*f).*s11+(c*c+a*c*f.*f.*f+b*c*f).*s01;