data = wavread('C:\Users\msi\Desktop\DSP\555\1\inputplusnoise.wav');
N=100;
Fs=44100;
fc=500/Fs;
omegac=2*pi*fc;
m=1;
for n=-(N-1)/2:(N-1)/2
if n==0
hD(m)=2*fc;
else
hD(m)=2*fc*sin(n.*omegac)./(n.*omegac);
end;
m=m+1;
end
m=1;
for n=-(N-1)/2:(N-1)/2
g(m)=0.54+0.46*cos(2*pi*n/N);
m=m+1;
end
h=hD.*g;
x=filter(h,1,data);
%wavplay(x,44100);
%for ()
length = 100;
length_h = 5;
y=zeros(890037,2);
y_n=zeros(length+length_h-1,1);
for k=1:length+length_h-1
    for n=1:length+length_h-1
        w(k,n)=exp(-j*2*pi*(k-1)*(n-1)/(length+length_h-1));
    end
end
    

for b=1:1:8900
    
            b
            a=zeros(length+length_h-1,1);

            for i=1:1:length

                a(i,1)=x((i+((b-1)*100)),1);

            end
            A=w*a;
            h_n=zeros(length+length_h-1,1);

            for i=1:1:length_h
                h_n(i)=1/length_h;
            end
            H=w*h_n;
            Y_n=A.*H;
            M=ctranspose(w);
            y_n=((1/(length+length_h-1))*M)*Y_n;
    for i=1:1:104
        y((100*(b-1))+i,1)=y((100*(b-1))+i,1)+y_n(i,1);
    end
end

for b=1:1:8900
    
            b
            a=zeros(length+length_h-1,1);

            for i=1:1:length

                a(i,1)=x((i+((b-1)*100)),2);

            end
            A=w*a;
            h_n=zeros(length+length_h-1,1);

            for i=1:1:length_h
                h_n(i)=1/length_h;
            end
            H=w*h_n;
            Y_n=A.*H;
            M=ctranspose(w);
            y_n=((1/(length+length_h-1))*M)*Y_n;
    for i=1:1:104
        y((100*(b-1))+i,2)=y((100*(b-1))+i,2)+y_n(i,1);
    end
end
y=real(y);
wavplay(data,44100);
wavplay(y,44100);


