clear all; 
[Sound_input,Fs1] = wavread('C:\Users\My Documents\Desktop\ข้อสี่\Sampling_rate\radioactive.wav');

D=0.5;
Order=2;

for i=0:Order
hi_D(i+1)=1;
    for(l=0:Order)
        if i~=l
            h_l=(D-l)/(i-l);
            hi_D(i+1)=hi_D(i+1)*h_l;
        end
    end
end

x=Sound_input(:,1);

for n=1:length(x)
    if n==1
        y(n)=hi_D(1)*x(n);
    end
    if n==2
        y(n)=(hi_D(1)*x(n))+(hi_D(2)*x(n-1));
    end
    if n>2
        y(n)=(hi_D(1)*x(n))+(hi_D(2)*x(n-1))+(hi_D(3)*x(n-2));
    end
end

a=0;
b=1;

for n=1:2*length(x)
    if mod(n,2)==1
        g(n)=x(n-a);
        a=a+1;
    end
    if mod(n,2)==0
        g(n)=y(n-b);
        b=b+1;
    end   
end
%subplot(3,1,1); plot(x);
%subplot(3,1,2); plot(y);
%subplot(3,1,3); plot(g);

%wavplay(x,Fs1);
%wavplay(y,Fs1);
%wavplay(g,2*Fs1);


D=1/3;
d=2/3;
Order=2;

for i=0:Order
hi_D(i+1)=1;
    for(l=0:Order)
        if i~=l
            h_l=(D-l)/(i-l);
            hi_D(i+1)=hi_D(i+1)*h_l;
        end
    end
end

x=Sound_input(:,1);

for n=1:length(x)
    if n==1
        y(n)=hi_D(1)*x(n);
    end
    if n==2
        y(n)=(hi_D(1)*x(n))+(hi_D(2)*x(n-1));
    end
    if n>2
        y(n)=(hi_D(1)*x(n))+(hi_D(2)*x(n-1))+(hi_D(3)*x(n-2));
    end
end

for i=0:Order
hi_d(i+1)=1;
    for(l=0:Order)
        if i~=l
            h_l=(d-l)/(i-l);
            hi_d(i+1)=hi_d(i+1)*h_l;
        end
    end
end

x=Sound_input(:,1);

for n=1:length(x)
    if n==1
        z(n)=hi_d(1)*x(n);
    end
    if n==2
        z(n)=(hi_d(1)*x(n))+(hi_d(2)*x(n-1));
    end
    if n>2
        z(n)=(hi_d(1)*x(n))+(hi_d(2)*x(n-1))+(hi_d(3)*x(n-2));
    end
end


a=2;
b=1;
c=0;

for n=1:3*length(x)
    if mod(n,3)==0
        g(n)=x(n-a);
        a=a+2;
    end
    if mod(n,3)==2
        g(n)=y(n-b);
        b=b+2;
    end
     if mod(n,3)==1
        g(n)=z(n-c);
        c=c+2;
    end
end

%subplot(4,1,1); plot(x);
%subplot(4,1,2); plot(y);
%subplot(4,1,3); plot(z);
%subplot(4,1,4); plot(g);

%wavplay(x,Fs1);
%wavplay(y,Fs1);
%wavplay(z,Fs1);
%wavplay(g,3*Fs1);

D=1/4;
d=2/4;
R=3/4;
Order=2;

for i=0:Order
hi_D(i+1)=1;
    for(l=0:Order)
        if i~=l
            h_l=(D-l)/(i-l);
            hi_D(i+1)=hi_D(i+1)*h_l;
        end
    end
end

x=Sound_input(:,1);

for n=1:length(x)
    if n==1
        y(n)=hi_D(1)*x(n);
    end
    if n==2
        y(n)=(hi_D(1)*x(n))+(hi_D(2)*x(n-1));
    end
    if n>2
        y(n)=(hi_D(1)*x(n))+(hi_D(2)*x(n-1))+(hi_D(3)*x(n-2));
    end
end

for i=0:Order
hi_d(i+1)=1;
    for(l=0:Order)
        if i~=l
            h_l=(d-l)/(i-l);
            hi_d(i+1)=hi_d(i+1)*h_l;
        end
    end
end

x=Sound_input(:,1);

for n=1:length(x)
    if n==1
        z(n)=hi_d(1)*x(n);
    end
    if n==2
        z(n)=(hi_d(1)*x(n))+(hi_d(2)*x(n-1));
    end
    if n>2
        z(n)=(hi_d(1)*x(n))+(hi_d(2)*x(n-1))+(hi_d(3)*x(n-2));
    end
end

for i=0:Order
hi_R(i+1)=1;
    for(l=0:Order)
        if i~=l
            h_l=(R-l)/(i-l);
            hi_R(i+1)=hi_R(i+1)*h_l;
        end
    end
end

x=Sound_input(:,1);

for n=1:length(x)
    if n==1
        v(n)=hi_R(1)*x(n);
    end
    if n==2
        v(n)=(hi_R(1)*x(n))+(hi_R(2)*x(n-1));
    end
    if n>2
        v(n)=(hi_R(1)*x(n))+(hi_R(2)*x(n-1))+(hi_R(3)*x(n-2));
    end
end

a=3;
b=2;
c=1;
e=0;

for n=1:4*length(x)
    if mod(n,4)==0
        g(n)=x(n-a);
        a=a+3;
    end
    if mod(n,4)==3
        g(n)=y(n-b);
        b=b+3;
    end
     if mod(n,4)==2
        g(n)=z(n-c);
        c=c+3;
     end
    if mod(n,4)==1
        g(n)=v(n-e);
        e=e+3;
    end
end

%subplot(5,1,1); plot(x);
%subplot(5,1,2); plot(y);
%subplot(5,1,3); plot(z);
%subplot(5,1,4); plot(v);
%subplot(5,1,5); plot(g);

%wavplay(x,Fs1);
%wavplay(y,Fs1);
%wavplay(z,Fs1);
%wavplay(v,Fs1);
%wavplay(g,4*Fs1);
