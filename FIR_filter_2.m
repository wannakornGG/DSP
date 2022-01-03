clear all;
clc;
N=100;
alpha=(N/2)-1;
upper_limit=(N/2)-1;


Fs=20000;
H=[0 3.162 3.162 3.162 5.623 5.623 5.623 17.783 17.783 56.234 56.234 56.234 56.234 56.234 100 100 100 100 100 177.828 177.828 177.828 177.828 177.828 177.828 177.828 177.828 177.828 316.228 316.228 316.228 316.228 316.228 316.228 316.228 316.228 316.228 316.228 316.228 0 0 0 0 0 0 0 0 0 0 0];
m=1;
for n=0:(N-1);
    for k=1:upper_limit
        inner(k)=2*abs(H(k+1))*cos(abs(2*pi*k*(n-alpha)/N));
    end
    tot_inner=sum(inner)+H(0+1);
    h(m)=(1/N)*tot_inner;
    m=m+1;
end

[H,q]=freqz(h,1,512,Fs);
amp_resp=abs(H);
phase_resp=angle(H);

figure(1);plot(q,amp_resp);
title('amplitude response of nonrecursive frequency sampling FIR filter,filter length = 9');
xlabel('Frequency in Hz');ylabel('Normalized Amplitude');axis([0 Fs/2 0 400]); grid;
fs=8000;
N=0:400;
f1=250;
t=N/fs;

x=sin(2*pi*f1*t);
figure(2);plot(t,x) ; xlabel('Time insecond') ; ylabel('Amplitude');
Y=filter(H,1,x)
figure(3);plot(t,Y) ; xlabel('Time insecond') ; ylabel('Amplitude');

X=fft(Y);
L=length(N);
Mag_X=abs(X(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(4);stem(f_scale,Mag_X);