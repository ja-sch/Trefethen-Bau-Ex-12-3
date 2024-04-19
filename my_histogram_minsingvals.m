% m = 16;
% N = 200000;
% % 
% obj = ResultManager;
% obj = obj.generate_res(m, N);
% %%%% histogram
% d = obj.res_minsingvals;
%%%% plot histogram
min_d = min(d)
max_d = max(d)
%%% create edges
% parameter (for tails)
min_d
min_d_rel = min_d * 2^m
max_d
k = m-2
al = 2^(-k)
% thresh = al * max_d
thresh = 2^(-(m))
edges = linspace(0, thresh)

clf
h = histogram(d, edges,'Normalization','cdf')
% histogram(d, edges,'Normalization','cdf')
my_median = median(d)
% histogram(d)
x0 = max(edges)
y0 = max(h.Values)
x = linspace(0, x0)
y = x * (y0/x0)
hold on
plot(x,y)

% Hypotheses:
% (1) Distribution is 
	% uniform in the tail [m_min, 0.01] for some value of m_min.
	% none or almost none in [0,m_min] (not sure what hypothesis should be on this interval]
	% we don't investigate the distribution on [0.01, \infty)
% (2) m_min = BigTheta(2^-m).
