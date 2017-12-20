figure(1)
plot(N, expt_data_mat2(1,:,3), 'r','LineWidth', 2.5)
hold on
% plot(Q_f, expt_data_mat2(:,1,1), 'g')
plot(N, expt_data_mat2(2,:,3), 'b','LineWidth', 2.5)
% plot(Q_f, expt_data_mat2(:,2,1), 'y')
plot(N, expt_data_mat2(3,:,3), 'm','LineWidth', 2.5)
% plot(Q_f, expt_data_mat2(:,3,1), 'k')
plot(N, expt_data_mat2(4,:,3), 'g','LineWidth', 2.5)
% plot(N, expt_data_mat(:,3,5), 'y','LineWidth', 2.5)
hold off
xlabel('True polynomial order Q_f')
ylabel('overfit measure')
% legend('N = 40', 'N = 80', 'N=120')
% legend('var = 0', 'var = 0.5', 'var = 1.0', 'var = 1.5', 'var = 2.0')
legend('Q_f = 5', 'Q_f = 10', 'Q_f = 15', 'Q_f = 20')
title('Mean of overfit measure with var=1.0')