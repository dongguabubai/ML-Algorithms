function [ num_iters, bounds] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bounds is the theoretical bound on the # of iterations
%              for each sample
%      (both the outputs should be num_samples long)
bounds = zeros(1,num_samples);
num_iters = zeros(1,num_samples);
for i = 1:num_samples
    weight = rand(1,d+1);
    weight(1) = 0;
    example = 2*rand(N,d) - 1;
    label = sign(weight(2:d+1)*transpose(example));
    data_in = transpose(vertcat(transpose(example),label));
    r = max(sqrt(sum(transpose(example).*transpose(example))));
    p = min(label.*(weight(2:d+1)*transpose(example)));
    mag = sqrt(sum(weight.*weight));
    bounds(i) = (r^2)*(mag^2)/(p^2);
    [ w, iterations ] = perceptron_learn( data_in );
    num_iters(i) = iterations;
end
end

