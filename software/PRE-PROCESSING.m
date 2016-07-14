w=21;
for n=1:1:w
   temparray1(n)=0;
end
for n=1:1:Len-w+1
   for i=0:1:20
       temparray1(i+1)=noise_1(n+i);
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
data_noise=noise_1(81:Len)-BL(1:Len-80);

for n=Len-79:1:Len
    data_noise(n)=0;
end