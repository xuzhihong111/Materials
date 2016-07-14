
userpath('D:\xzh\MITData\ECG ÐÄÂÉÊ§³£');
savepath;
ex=importdata('112.txt');
Len=length(ex.data);
data13=ex.data(1:Len,2);

for n=1:1:Len
   if(mod(n,10)==0)
    data4(n/10)=data13(n); 
   end
end
N1=Len/10;

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


fip=fopen('112-2.txt','wt');
fprintf(fip,'%g\n',w32);
fclose(fip);





