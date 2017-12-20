function [ w, iterations ] = perceptron_learn( data_in )
%perceptron_learn Run PLA on the input data
%   Inputs: data_in: Assumed to be a matrix with each row representing an
%                    (x,y) pair, with the x vector augmented with an
%                    initial 1, and the label (y) in the last column
%   Outputs: w: A weight vector (should linearly separate the data if it is
%               linearly separable)
%            iterations: The number of iterations the algorithm ran for

[m, n]= size(data_in);
w = zeros(1,n - 1);
data = data_in(:, 1:n - 1);
desired_out = data_in(:,n);
iterations = 0;
while true
    out = sign(transpose(w*transpose(data)));
    iterations = iterations + 1;
    count = 0;
     for j = 1:m
         count = count + 1;
         if out(j) ~= desired_out(j)
             w = w + desired_out(j)*data(j, :);
             count = 0;
         end
     end
     if count == m
         break;
     end
end