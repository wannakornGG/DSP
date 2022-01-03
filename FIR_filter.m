clear all;
clc;
N=100;
alpha=(N/2)-1;
upper_limit=(N/2)-1;
Fs=20000;
H=[10 10 10 10 10 10 10 10 10 31.62 31.62 31.62 31.62 31.62 31.62 100 100 100 100  100 100 100 100  100 100 100 100 100 100 31.62 31.62 31.62 31.62 31.62 31.62 31.62 31.62 31.62 31.62 0 0 0 0 0 0 0 0 0 0 0];
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
xlabel('Frequency in Hz');ylabel('Normalized Amplitude');axis([0 Fs/2 0 100]); grid;

figure(2);plot(q,phase_resp*180/pi);
title('Phase response of nonrecursive frequency sampling FIR filter,filter length = 9');
xlabel('Frequency in Hz');ylabel('Normalized Amplitude');axis([0 Fs/2 -200 200]); grid;