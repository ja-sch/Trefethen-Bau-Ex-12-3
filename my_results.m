function [temp_all_eigvals, ... eigenvalues
    temp_all_specrads, ... spectral radiuses
    temp_all_twonorm,... 2-norms
    temp_all_smallest_singval ... minimal singular values
    ] = my_results(m, N)
%
% Generate results for a given size of matrix and sample size.
%  Input: 
%    m: positive integer -- size of a matrix.
%    N: positive integer -- size of sample.
% Output:
%   experiment results for the input m, N.
%------------------------------------------------%

%%%% allocate dumps piles for results
    temp_all_eigvals = zeros(1, m*N);
    temp_all_specrads = zeros(1, N);
    temp_all_twonorm = zeros(1, N);
    temp_all_smallest_singval = zeros(1, N);
    
    %%% generate results
    for i=1:N
        % generate random matrix
        A = rand(m,m)/sqrt(m);
        % create new sample (for each parameter)
        new_eigvals = eig(A);
        new_specrad = max(abs(new_eigvals));
        new_twonorm = norm(A, 2);
        new_smallest_singval = min(svd(A));
        % add sample to dump (for each parameter)
        temp_all_eigvals((i-1)*m + (1:m)) = new_eigvals;
        temp_all_specrads(i) = new_specrad;
        temp_all_twonorm(i) = new_twonorm ;
        temp_all_smallest_singval(i) = new_smallest_singval;
    end 
end