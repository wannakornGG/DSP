clear all;
clc;
%?????????
N=200;
alpha=(N/2)-1;
upper_limit=(N/2)-1;

Fs=20000;
H=[0 0 0 3.1622 3.1622 3.1622 3.1622 3.1622 3.1622 3.1622 3.1622 5.6234 5.6234 5.6234 5.6234 5.6234 17.7828 17.7828 17.7828 17.7828 17.7828 56.2341 56.2341 56.2341 56.2341 56.2341 56.2341 56.2341 56.2341 56.2341 56.2341 100 100 100 100 100 100 100 100 100 100 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 177.8279 316.2278  316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 316.2278 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
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
title('amplitude response of nonrecursive frequency sampling FIR filter');
xlabel('Frequency in Hz');ylabel(' Amplitude');axis([0 Fs/2 0 400]); grid;

%sine 250 Hz
f1=250;
fs=10000;
N=0:5000;
t=N/fs;
x1=sin(2*pi*f1*t)
X1=fft(x1);
L=length(N);
Mag_X1=abs(X1(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(2);plot(f_scale,Mag_X1); xlabel('Frequency in Hz');
ylabel('Amplitude');
y1=filter(h,1,x1)
Y1=fft(y1);
L=length(N);
Mag_Y1=abs(Y1(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(3);plot(f_scale,Mag_Y1); xlabel('Frequency in Hz');
ylabel('Amplitude');
%sine 500 Hz
f2=500;
fs=20000;
N=0:5000;
t=N/fs;
x2=sin(2*pi*f2*t)
X1=fft(x2);
L=length(N);
Mag_X2=abs(X1(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(4);plot(f_scale,Mag_X2); xlabel('Frequency in Hz');
ylabel('Amplitude');
y2=filter(h,1,x2)
Y2=fft(y2);
L=length(N);
Mag_Y2=abs(Y2(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(5);plot(f_scale,Mag_Y2); xlabel('Frequency in Hz');
ylabel('Amplitude');
%sine 1500 Hz
f3=1500;
fs=22000;
N=0:5000;
t=N/fs;
x3=sin(2*pi*f3*t)
X3=fft(x3);
L=length(N);
Mag_X3=abs(X3(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(6);plot(f_scale,Mag_X3); xlabel('Frequency in Hz');
ylabel('Amplitude');
y3=filter(h,1,x3)
Y3=fft(y3);
L=length(N);
Mag_Y3=abs(Y3(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(7);plot(f_scale,Mag_Y3); xlabel('Frequency in Hz');
ylabel('Amplitude');
%sine 3000 Hz
f4=3000;
fs=22000;
N=0:5000;
t=N/fs;
x4=sin(2*pi*f4*t)
X4=fft(x4);
L=length(N);
Mag_X4=abs(X4(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(8);plot(f_scale,Mag_X4); xlabel('Frequency in Hz');
ylabel('Amplitude');
y4=filter(h,1,x4)
Y4=fft(y4);
L=length(N);
Mag_Y4=abs(Y4(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(9);plot(f_scale,Mag_Y4); xlabel('Frequency in Hz');
ylabel('Amplitude');
%sine 6000 Hz
f5=6000;
fs=22000;
N=0:5000;
t=N/fs;
x5=sin(2*pi*f5*t)
X5=fft(x5);
L=length(N);
Mag_X5=abs(X5(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(10);plot(f_scale,Mag_X5); xlabel('Frequency in Hz');
ylabel('Amplitude');
y5=filter(h,1,x5)
Y5=fft(y5);
L=length(N);
Mag_Y5=abs(Y5(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(11);plot(f_scale,Mag_Y5); xlabel('Frequency in Hz');
ylabel('Amplitude');
%sine 8000 Hz
f6=8000;
fs=24000;
N=0:5000;
t=N/fs;
x6=sin(2*pi*f6*t)
X6=fft(x6);
L=length(N);
Mag_X6=abs(X6(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(12);plot(f_scale,Mag_X6); xlabel('Frequency in Hz');
ylabel('Amplitude');
y6=filter(h,1,x6)
Y6=fft(y6);
L=length(N);
Mag_Y6=abs(Y6(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(13);plot(f_scale,Mag_Y6); xlabel('Frequency in Hz');
ylabel('Amplitude');
%sine 1000 Hz
f7=1000;
fs=25000;
N=0:5000;
t=N/fs;
x7=sin(2*pi*f7*t)
X7=fft(x7);
L=length(N);
Mag_X7=abs(X7(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(14);plot(f_scale,Mag_X7); xlabel('Frequency in Hz');
ylabel('Amplitude');
y7=filter(h,1,x7)
Y7=fft(y7);
L=length(N);
Mag_Y7=abs(Y7(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(15);plot(f_scale,Mag_Y7); xlabel('Frequency in Hz');
ylabel('Amplitude');
%sine 4000 Hz
f8=4000;
fs=19900;
N=0:5000;
t=N/fs;
x8=sin(2*pi*f8*t)
X8=fft(x8);
L=length(N);
Mag_X8=abs(X8(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(16);plot(f_scale,Mag_X8); xlabel('Frequency in Hz');
ylabel('Amplitude');
y8=filter(h,1,x8)
Y8=fft(y8);
L=length(N);
Mag_Y8=abs(Y8(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(17);plot(f_scale,Mag_Y8); xlabel('Frequency in Hz');
ylabel('Amplitude');
% Ytotlal
N=0:5000;
fs=24000;
Ytotal=Y1+Y2+Y3+Y4+Y5+Y6+Y7+Y8;
L=length(N);
Mag_Yto=abs(Ytotal(1:L/2)./(L/2));
f_scale=(0:(L/2)-1).*(fs/L);
figure(18);plot(f_scale,Mag_Yto); xlabel('Frequency in Hz');
ylabel('Amplitude');