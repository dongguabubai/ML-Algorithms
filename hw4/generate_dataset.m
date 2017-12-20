function [ train_set, test_set ] = generate_dataset( Q_f, N_train, N_test, sigma )
%GENERATE_DATASET Generate training and test sets for the Legendre
%polynomials example
%   Inputs:
%       Q_f: order of the hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       sigma: standard deviation of the stochastic noise
%   Outputs:
%       train_set and test_set are both 2-column matrices in which each row
%       represents an (x,y) pair
X_train = rand(N_train, 1)*2 - 1;
X_test = rand(N_test, 1)*2 - 1;

n = 0:Q_f;
scaling = sqrt(sum(1./(2*n+1)));

f_train = computeLegPoly(X_train, Q_f)*scaling;
f_test = computeLegPoly(X_test, Q_f)*scaling;

f_train = f_train + sigma*normrnd(0,1,[length(f_train),1]);

train_set = [X_train f_train];
test_set = [X_test f_test];
