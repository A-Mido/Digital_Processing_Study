a = 0.8;
w=0:0.1:2*pi;
xw=[0];
for k0=1:63
    xw(k0) = (1 - a^(2)) / (1 - 2 * a * cos(w(k0)) + a^(2));
end
figure(1)
plot(w, xw);
xlabel('w') 
ylabel('P(w)')
title('Fourier Transform')


N = 100;
xb = 0:N-1;
xwb=[0];
for k0=0:N-1
    xwb(k0+1) = (1 - a^(2)) / (1 - 2 * a * cos(2*pi*k0/N) + a^(2));
end

figure(2)
plot(xb, xwb);
xlabel('w') 
ylabel('P(w)')
title('Discrete Fourier Transform at N=100')

n = 0:N-1;
xn=[0];
for n0 = 0:N-1
    result = 0;
    for k0=0:N-1
        w0 = 2*pi*k0/N;
       result = result + xwb(k0+1)* exp(1j*w0*n0);
    end
    xn(n0+1) = result;
end

figure(3)
xn = xn / N;
plot(n, abs(xn));
xlabel('n') 
ylabel('x(n)')
title('Reconstructed signal at N = 100')