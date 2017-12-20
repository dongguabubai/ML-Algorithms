load zip.train;

fprintf('Working on the three-vs-five problem...\n\n');
subsample = zip(find(zip(:,1)==3 | zip(:,1) == 5),:);
Y = subsample(:,1);
[n,m] = size(Y);
for i=1:n
    if Y(i) == 1
        Y(i) = 1;
    end
    if Y(i) == 3
        Y(i) = -1;
    end
end
X = subsample(:,2:257);
load zip.test;
subsample_test = zip(find(zip(:,1)==1 | zip(:,1) == 3),:);
Y_test = subsample_test(:,1);
X_test = subsample_test(:,2:257);
[nt,mt] = size(Y_test);
for i=1:nt
    if Y_test(i) == 1
        Y_test(i) = 1;
    end
    if Y_test(i) == 3
        Y_test(i) = -1;
    end
end

    
[train_err, test_err] = AdaBoost(X, Y, X_test, Y_test, 200);

%     fprintf('The train error is %.4f and test error is %.4f\n',train_err,test_err);


figure(1)
plot((1:1:200), train_err, 'r','LineWidth', 2.5);
hold on
plot((1:1:200), test_err, 'b','LineWidth', 2.5)
hold off
legend('train_err', 'test_err')
xlabel('Number of weak hypothesis');
ylabel('Error rate');
title('Adaboost on the one-vs-three problem');

% ct = fitctree(X,Y);
% pre = predict(ct, X_test);
% err = 0;
% for i=1:nt
%     if pre(i) ~= Y_test(i)
%         err = err + 1;
%     end
% end
% err = err / nt;
% 
% fprintf('The test error for a single decision tree is %.4f\n', err);
% 
% numBags = 200;
% [n,m] = size(X);
% trainingData = [X Y];
% sampleInd = zeros(numBags, n);
% trees = {};
% for i=1:numBags
% %     sampleData = datasample(trainingData, n);
%     sampleInd(i,:) = datasample((1:n), n);
%     sampleData = trainingData(sampleInd(i,:), :);
%     trees{end + 1} = fitctree(sampleData(:, 1:m), sampleData(:,m+1));     
% end
% test_err = 0;
% for i=1:nt
%     res = zeros(1,numBags);
%     for j=1:numBags
%         res(j)=predict(trees{j}, X_test(i,:));
%     end
%     finalres = mode(res);
%     if finalres ~= Y_test(i)
%         test_err = test_err + 1;
%     end
% end
% test_err = test_err/n;
% fprintf('The test error for 200 bagged decision tree is %.4f\n', test_err);