
userpath('D:\xzh\MITData\ECGÐÄÂÉÊ§³£');
savepath;
ex=importdata('112.txt');
Len=length(ex.data);
data13=ex.data(1:Len,1);



w=21;
for n=1:1:w
   temparray1(n)=0;
end
for n=1:1:Len-w+1
   for i=0:1:20
       temparray1(i+1)=data13(n+i);
   end
   temparray2=sort(temparray1);
   base_line(n)=temparray2(11);
end
for n=Len-w+1:1:Len
   base_line(n)=0;
end
for n=1:1:160
   average_base_line(n)=0;
end
for n=1:1:Len-160
   for i=0:1:160
   average_base_line(i+1)=base_line(n+i);
   end
   BL(n)=sum(average_base_line)/160;
end
for n=Len-159:1:Len
   BL(n)=0;
end
data_noise=data13(81:Len)'-BL(1:Len-80);

for n=Len-79:1:Len
    data_noise(n)=0;
end

for n=1:1:Len
    if(mod(n,2)==0)
    data4(n/2)=data_noise(n); 
    end
end

N1=Len/2;


x1=mean(data4);
data4=data4-x1;
w12=xcorr(data4,N1-1);
w12=w12(N1:2*N1-1);
w12=w12./w12(1);

w22=xcorr(w12,N1-1);
w22=w22(N1:2*N1-1);
w22=w22./w22(1);
w32=xcorr(w22,N1-1);
w32=w32(N1:2*N1-1);
w32=w32./w32(1);


figure(3)
subplot(2,1,1);
plot(data13');
xlabel('Time(samples)');
ylabel('Amplitude(mV)');

subplot(2,1,2);
plot(data_noise(1:Len),'b');
xlabel('Time(samples)');
ylabel('Amplitude(mV)');

N=Len/2;
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


fip=fopen('SQM.txt','wt');
fprintf(fip,'%g\n',R3);
fclose(fip);

figure(4);
plot(w32,'r');
hold on
plot(f,R3./R3(1),'b');
xlabel('Time(samples)');
fip=fopen('112-2.txt','wt');
fprintf(fip,'%g\n',w32);
fclose(fip);





