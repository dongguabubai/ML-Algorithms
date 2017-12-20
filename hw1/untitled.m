x = (-1:0.01:1);
y = x.^2;
plot(x,y);
hold on
x1 = zeros(100,2);
for i = 1:100
    x1(i,:) = 2*rand(1,2) - 1;
    plot(x1(i,:), x1(i,:).^2);
    hold on
end
y1 = x1.^2;
x2 = sum(x1)./100;
hold on
line([-1,1], x2.^2*5);
