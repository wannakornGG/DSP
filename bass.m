clear all;
[x,fs]=wavread('jet');

L=(0:length(x)-1);
N=length(L)
t=L/fs;
figure(1);plot(L,x);axis([0 9*10^6 -1.5 1.5]);
xlabel('sample index');
ylabel('amplitude'); title('input');
figure(2);plot(t,x);axis([0 200 -1.5 1.5]);
xlabel('Time in second ');
ylabel('amplitude'); title('input');
%
% trim %
t1=18;
t2=26;
start=t1*44100;
stop=t2*44100;
totaltime=t1:t2;
N=(t1*44100):(t2*44100);
y=x(start:stop);
L=(0:length(N)-1);
t=L/fs;
figure(4);plot(L,y);
xlabel('sample index');
ylabel('amplitude'); title('input');
figure(5);plot(t,y);
xlabel('Time in second ');
ylabel('amplitude'); title('input');
%ffttrim
%fft trim
Y=fft(y);
L=length(N);
Mag=abs(Y(1:L/2))./(L/2);
fscale=(0:(L/2)-1).*(fs/L);
figure(20);plot(fscale,Mag);
xlabel('frequency in Hz');
ylabel('amplitude');axis([0 15000 0 0.04]);
%LPF
N=5000;
fs=44100;
fc=200;
fc=fc/fs;
wc=2*pi*fc;

m=1;
for n=-(N-1)/2:(N-1)/2
    if n==0
        h(m)=2*fc;
    else
        h(m)=2*fc*sin(n.*wc)./(n.*wc);
    end;
    m=m+1;
end
[H,q]=freqz(h,1,512,fs);
amp_resp=abs(H);
phase_resp=angle(H);
figure(1); plot(q,amp_resp); title('Amplitude response of Lowpass FIR filter by Hamming window');
xlabel('Frequency in Hz'); ylabel('Normalized Amplitude'); axis([0 1000 0 1.2]);

output=conv(h,y);
sound(output,fs);
%plot window
figure(7);
subplot(2,1,1);plot(output);
subplot(2,1,2);plot(q,amp_resp);title('Guitar');  %plot amp resp
xlabel('Freq in Hz');ylabel('Amplitude');axis([0 10000 0 3]);
figure(8);
subplot(2,1,2);plot(q,phase_resp*180/pi);title('Phase response of Bandpass FIR filter');  %plot phase resp
xlabel('Freq in Hz');ylabel('Phase Response in Degree');axis([0 fs/2 -200 200]);grid;
subplot(2,1,1);plot(q,20*log10(amp_resp));title('Amplitude response of Bandpass FIR Filter');
xlabel('Freq in Hz');ylabel('Amplitude Response in dB');axis([0 fs/2 -100 10]);grid;
sound(output,fs);
plot(output);
%plot fft O/P
OUTPUT=fft(output);
Mag=abs(OUTPUT(1:L/2))./(L/2);
frequecy=(0:(L/2)-1).*(fs/L);
figure(21); plot(frequecy,Mag);
xlabel('frequency in Hz');ylabel('amplitude');axis([0 1000 0 0.05]);