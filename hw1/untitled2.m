res = abs(round(10*rand(1,1000))/10 - 0.5);
n = numel(res);
h = histogram(res, n);
figure;
x = [0:0.01:0.5];
y = 2*exp(-12*x.^2);
plot(x, y);