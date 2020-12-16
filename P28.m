a = 0.95;
n = -15:1:15;
xn=[0];
counter = 1;
for k0=-15:15
    if -1*k0 > 0 && -1*k0 <= 10
        x = -1*k0;
        xn(counter) = a^(x);
    elseif k0 >= 0 && k0 <= 10
         xn(counter) = a^(k0);
    else 
        xn(counter) = 0;
    end 
    counter = counter + 1;
end
figure(1);
plot(n, xn)
xlabel('n') 
ylabel('x(n)') 
title('Discrte time domain signal')

kx1 = 0:1:100;
xk1 = [0];

for k1=0:100
    result1 = 0;
    w1 = 2*pi*k1/(200);
    for k2 = -15:15
        result1 = result1 + xn(k2 + 15 + 1) * exp(-1*1i*w1*k2);
    end
    xk1(k1+1) = result1;
end
    
figure(2)
plot(kx1, real(xk1))
xlabel('w') 
ylabel('x(w)') 
title('Discrte Fourier Transform')

N = 30; %change N
kx2 = 0:1:N-1;
xk2 = [0];
for k3=0:N-1
    result2 = 0;
    w2 = 2*pi*k3/(N);
    for k4 = -15:15
        result2 = result2 + xn(k4 + 15 + 1) * exp(-1*1i*w2*k4);
    end
    xk2(k3+1) = result2;
end

ck = xk2 / N;

figure(3);
plot(kx2, abs(ck))
axis([0 30 -0.2 1.5])
xlabel('k') 
ylabel('Ck') 
title('Fourier series coeffecients')


esx = [0];
for k3= -15:15
    result2 = 0;
    w2 = 2*pi*k3/(N);
    for k4 = 0:N-1
        result2 = result2 + ck(k4 + 1) * exp(-1*1i*w2*k4);
    end
    esx(k3 + 15 + 1) = result2;
end

figure(4);
plot(n, abs(esx))
axis([-10 10 0.6 1.6])
xlabel('n') 
ylabel('estimated x')
title('estimated x')

esx1 = xn;
p=10;
P=p*N + length(xn);
esx2 = [zeros(1,P)];
for z=0:p
    esx2 = esx2 + [zeros(1,z*N), esx1, zeros(1,P-z*N-length(xn))];
end

figure(5);
nesx2 = 0:length(esx2)-1;
plot(nesx2, abs(esx2))
axis([20 160 0 2])
xlabel('n') 
ylabel('xp(n)')
title('periodic x')
