clear all;
[x,fs]=wavread('tattoo.wav');
L=(0:length(x)-1);
N=length(L)
t=L/fs;
figure(1);plot(L,x);axis([0 9*10^6 -1.5 1.5]);
xlabel('sample index');
ylabel('amplitude'); title('input');
figure(2);plot(t,x);axis([0 200 -1.5 1.5]);
xlabel('Time in second ');
ylabel('amplitude'); title('input');
% trim %
t1=103;
t2=119;
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
%fft trim
%fft trim
Y=fft(y);
L=length(N);
Mag=abs(Y(1:L/2))./(L/2);
fscale=(0:(L/2)-1).*(fs/L);
figure(20);plot(fscale,Mag);
xlabel('frequency in Hz');ylabel('amplitude');axis([100 16000 0 0.05]);
%BPF
N=5000;     %filter lenght
fs=44100;
fc1=125;   % f cut-off 1
fc1=fc1/fs;
fc2=2000;
fc2=fc2/fs;  % f cut-off 2

omegac1=2*pi*fc1;
omegac2=2*pi*fc2;

m=1;
for n=-(N-1)/2:(N-1)/2
    if n==0
        h(m)=2*(fc2-fc1);
    else
        h(m)=(2*fc2*sin(n.*omegac2)./(n.*omegac2))-(2*fc1*sin(n.*omegac1)./(n.*omegac1));
    end;
    m=m+1;
end
[H,q]=freqz(h,1,512,fs);
amp_resp=abs(H);
phase_resp=angle(H);
        
output=conv(h,y);

figure(7);
plot(q,amp_resp);title('Bandpass Filter');  %plot amp resp
xlabel('Freq in Hz');ylabel('Amplitude');axis([0 16000 0 1.2]);
figure(8);
subplot(2,1,2);plot(q,phase_resp*180/pi);title('Phase response of Bandpass FIR filter');  %plot phase resp
xlabel('Freq in Hz');ylabel('Phase Response in Degree');axis([0 fs/2 -200 200]);grid;
subplot(2,1,1);plot(q,20*log10(amp_resp));title('Amplitude response of Bandpass FIR Filter');
xlabel('Freq in Hz');ylabel('Amplitude Response in dB');axis([0 fs/2 -100 10]);grid;
figure(9);
plot(output);

OUTPUT=fft(output);
Mag=abs(OUTPUT(1:L/2))./(L/2);
frequecy=(0:(L/2)-1).*(fs/L);
figure(21); plot(frequecy,Mag);
xlabel('frequency in Hz');ylabel('amplitude');axis([100 16000 0 0.05]);
 
 
sound(output,0.5*fs);
