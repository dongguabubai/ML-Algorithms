a = csvread('clevelandtrain.csv',1,0);
[n,m] = size(a);
X = a(:,1:m-1);
X = zscore(X);
y = a(:,m);
buildin = glmfit(X, y, 'binomial');
for i=1:n
    if y(i) == 0
        y(i) = -1;
    end
end
w_init = zeros(1, m);
max_its = 100000000000;
eta = 10^(-5);
[ w, e_in ] = logistic_reg( X, y, w_init, max_its, eta );

b = csvread('clevelandtest.csv',1,0);
[nt,mt] = size(b);
Xt = b(:,1:mt - 1);
Xt = zscore(Xt);
yt = b(:,mt);
for i=1:nt
    if yt(i) == 0
        yt(i) = -1;
    end
end
buildin_error = find_test_error(transpose(buildin), Xt, yt);
test_error = find_test_error(w, Xt, yt);
train_error = find_test_error(w, X, y);