L = 100;
f1=1/18;
f2=5/128;
fc=50/128;
n = 0:L-1;
xn=[0];
xc=[0];
xam=[0];
for k0=1:L
   xn(k0) = cos(2*pi*f1*k0) + cos(2*pi*f2*k0);
   xc(k0) = cos(2*pi*fc*k0);
   xam(k0) = xn(k0) * xc(k0);
end

figure(1)
subplot(3,1,1)
plot(n, xn)
xlabel('n') 
ylabel('x(n)')

subplot(3,1,2)
plot(n, xc)
xlabel('n') 
ylabel('xc(n)')

subplot(3,1,3)
plot(n, xam)
xlabel('n') 
ylabel('Xam(n)')

N = 128;
nw = 0:N-1;
xw= [0];
for n0=0:N-1
    result = 0;
    for k1=0:L-1
        w = 2*pi*k1/N;
        result = result + xam(k1+1) * exp(-1*1j*w*n0);
    end
    xw(n0+1) = result;
end

figure(2)
plot(nw, abs(xw));
xlabel('k') 
ylabel('X(2*pi*k/N)')
title('X(w) at N=128 and L=100')