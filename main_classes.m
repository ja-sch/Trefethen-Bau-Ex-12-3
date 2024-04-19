clf % clear figures
%
N = 100; % no of samples
a = ResultManager;
%%%%
%%% m = 32
m = 4; % size of generated matrices
%
a = a.generate_res(m, N);
%
a.plot_eigvals()