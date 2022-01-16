close all;
clear all;
clc;
%----- Sound input------
x = wavread('aaa');
x = x';
Fs1 = 11025;
wavplay(x,Fs1);

J = [0:1:100];
I = [0:1:100];
L = [0:1:100];

types = '4';

switch types
    case '2'
        %-------Interpolate 2 -------
        k = 2;
        d = 0.5;
        for i = 1:k+1
            for j = 1:k+1
                if (i ~= j) 
                     h(j,i) = prod((d-L(j))./(I(i)-L(j)));
                end
            end
        end

        h = h+eye(k+1);
        h = prod(h,1);

        y = filter(h,1,x);
        %wavplay(y,Fs);
        n = 2; %--Double Interpolation---
        z = [];
        m = 1;
        for i = 1:(length(2.*x));
             z(2*m) = x(m);
             z(2*m-1) = y(m);
             m = m+1;
        end

        p = 1;
        for i = 1:(length(z)-1);
            output(p) = z(p+1);
            p = p+1;
        end
        Fs2 = Fs1*n;
        N2 = 0:(length(x).*n)-2;
        t2 = N2./Fs2;
        wavplay(output,Fs2);
        
    case '3'   
        %--- fractional delay = 0.33 ---
        k = 2;
        d1 = 0.33;
        for i = 1:k+1
            for j = 1:k+1
                if (i ~= j) 
                     h1(j,i) = prod((d1-L(j))./(I(i)-L(j)));
                end
            end
        end

        h1 = h1+eye(k+1);
        h1 = prod(h1,1);

        y1 = filter(h1,1,x);
        %--- fractional delay = 0.67 ---        
        d2 = 0.67;
        k = 2;
        for i = 1:k+1
            for j = 1:k+1
                if (i ~= j) 
                     h2(j,i) = prod((d2-L(j))./(I(i)-L(j)));
                end
            end
        end

        h2 = h2+eye(k+1);
        h2 = prod(h2,1);
        y2 = filter(h2,1,x);
        
        %------- Triple Interpolate---
        n = 3 %-- Triple Interpolate---
        z = [];
        m = 1;
        for i = 1:(length(3.*x))
            z(3*m-2) = y2(m);
            z(3*m-1) = y1(m);
            z(3*m) = x(m);
            m = m+1;
        end
        
        p = 1;
        for i = 1:(length(z)-2);
            output(p) = z(p+2);
            p = p+1;
        end
        Fs2 = Fs1*n;
        N2 = 0:(length(x).*n)-3;
        t2 = N2./Fs2;
        wavplay(output,Fs2);        
        
    case '4'   
        %--- fractional delay = 0.25 ---
        k = 2;
        d1 = 0.25;
        for i = 1:k+1
            for j = 1:k+1
                if (i ~= j) 
                     h1(j,i) = prod((d1-L(j))./(I(i)-L(j)));
                end
            end
        end

        h1 = h1+eye(k+1);
        h1 = prod(h1,1);
        
        y1 = filter(h1,1,x);
        
        %--- fractional delay = 0.5 ---        
        d2 = 0.5;
        k = 2;
        for i = 1:k+1
            for j = 1:k+1
                if (i ~= j) 
                     h2(j,i) = prod((d2-L(j))./(I(i)-L(j)));
                end
            end
        end

        h2 = h2+eye(k+1);
        h2 = prod(h2,1);

        y2 = filter(h2,1,x);
        
        %--- fractional delay = 0.75 ---        
        d3 = 0.75;
        k = 2;
        for i = 1:k+1
            for j = 1:k+1
                if (i ~= j) 
                     h3(j,i) = prod((d3-L(j))./(I(i)-L(j)));
                end
            end
        end

        h3 = h3+eye(k+1);
        h3 = prod(h3,1);

        y3 = filter(h3,1,x);
       
        %------- Four time Interpolate -------
        n = 4 %-- Four time Interpolate---
        z = [];
        m = 1;
        for i = 1:(length(4.*x));
            z(4*m-3) = y3(m);
            z(4*m-2) = y2(m);
            z(4*m-1) = y1(m);
            z(4*m) = x(m);
            m = m+1;
        end
        
        p = 1;
        for i = 1:(length(z)-4)
            output(p) = z(p+4);
            p = p+1;
        end
        Fs2 = Fs1*n;
        N2 = 0:(length(x).*n)-5;
        t2 = N2./Fs2;
        wavplay(output,Fs2);   
end
        
       
