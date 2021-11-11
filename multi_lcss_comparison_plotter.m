%% Plot the polynomial bounding the indicator function
load('data015.mat');
t_end = 25;
t      = 0:0.001:t_end;
alfa_4 = optThreshold;
poly_q = double(vpa(polycoeffs,6));

figure;
yyaxis left
histogram(q_lqg, "Normalization","pdf", 'FaceColor', 'cyan', 'FaceAlpha', 0.3);
ylabel('$P_{q}$','Interpreter','latex', 'FontSize', 10);
hold on; 
histogram(q, "Normalization","pdf", 'FaceColor', 'red', 'FaceAlpha', 0.4);
% Plot the moment based polynomials
yyaxis right
% Tightened bound for k = 4
plot(t, polyval(poly_q,t),'-b', 'LineWidth',3);
% Plot Indicator Functions
x_indicator = [0 alfa_4 alfa_4 t(end) t(end)];
y_indicator = [0 0 1 1 0];
patch(x_indicator,y_indicator,'blue', 'FaceAlpha',0.3);
% Plot the threshold
y_opt = [0 1 2 3];
len_y = length(y_opt);
x_a_opt = alfa_4*ones(1,len_y);
plot(x_a_opt, y_opt, ':b', 'Marker','^');
% Plot the threshold text
text(x_a_opt(end)-3.0, y_opt(end), '$\alpha^{\star}_{q,4,MLQG}$','Interpreter','latex', 'FontSize', 40)
xlim([0,t(end)])
ylim([0,10])
xlabel('Distance Measure $q$','Interpreter','latex', 'FontSize', 40);
ylabel('g(q)','Interpreter','latex', 'FontSize', 40);
legend('$\mathbf{P}_{q}$ with LQG', '$\mathbf{P}_{q}$ with MLQG', '$g_{MLQG}(q)$ with $\sigma^{2}_{a,1} = \sigma^{2}_{c,1} = 0.15$', '$\bf{1}_{\geq \alpha^{\star}_{q,4}}$ from MLQG', '$\alpha^{\star}_{q,4,MLQG}$', '$\mathbf{P}_{q}$ with MLQG', '$g_{MLQG}(q)$ with $\sigma^{2}_{a,1} = \sigma^{2}_{c,1} = 0.07$', '$\bf{1}_{\geq \alpha^{\star}_{q,4}}$ from MLQG', '$\alpha^{\star}_{q,4,MLQG}$', 'FontSize', 30, 'Interpreter','latex');
a = findobj(gcf, 'type', 'axes');
h = findobj(gcf, 'type', 'line');
set(h, 'linewidth', 4);
set(a, 'linewidth', 4);
set(a, 'FontSize', 40);
set(gca,'TickLabelInterpreter','latex');
% Plot the zoomed in picture
hold on;
axes('Position',[.48 .3 .4 .2])
box on;
h4 = histogram(q, 1000,'EdgeColor', 'none','FaceColor','red', 'FaceAlpha', 0.7, 'BinLimits',[15,t_end]);
h4.Normalization = 'probability';
h4.BinWidth = 0.05;
hold on;
h3 = histogram(q_lqg, 1000,'EdgeColor', 'none','FaceColor','cyan', 'FaceAlpha', 0.3, 'BinLimits',[15,t_end]);
h3.Normalization = 'probability';
h3.BinWidth = 0.05;
hold on;
plot([alfa_4 alfa_4], [0 0.00001], ':b', 'Marker','^');
grid on;
xlim([15 25])
xlabel('$q$','Interpreter','latex', 'FontSize', 40);
ylabel('$P_{q}$','Interpreter','latex', 'FontSize', 40);
a = findobj(gcf, 'type', 'axes');
h = findobj(gcf, 'type', 'line');
set(h, 'linewidth', 4);
set(a, 'linewidth', 4);
set(a, 'FontSize', 40);
set(gca,'TickLabelInterpreter','latex')