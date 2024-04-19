classdef ResultManager
    % Container for my results of an experiment.
    %---------------------------------------%
    properties
        m
        res_eigvals
        res_specrad
        res_2norms
        res_minsingvals
    end

    methods
        function obj = ResultManager()
            % Construct an instance of this class.
            
        end
        
        function [] = plot_eigvals(obj)
            % Plot eigenvalues.
            %-----------------%
            scatter_complex(obj.res_eigvals)
            title('Eigvals, m=' + string(obj.m))
        end

        function [] = plot_specrad(obj)
            % Plot spectral radiuses.
            %-----------------%
            default_circlesize = 36;
            sz = default_circlesize;
            %
% 			fprintf("Plotting spectral radiuses")
			y = zeros(1, size(obj.res_specrad, 2));
            scatter(obj.res_specrad, y, sz)
            title('Specrads, m=' + string(obj.m))
        end

        function [] = plot_2norms(obj)
            % Plot 2-norms.
            %-----------------%
            default_circlesize = 36;
            sz = default_circlesize;
            %
% 			fprintf("Plotting 2-norms")
			y = zeros(1, size(obj.res_2norms, 2));
            scatter(obj.res_2norms, y, sz)
            title("2-norms, m=" + string(obj.m))
        end

        function [] = plot_minsingvals(obj)
            % Plot minimal singular values.
            %-----------------%
            default_circlesize = 36;
            sz = default_circlesize;
            default_color = [0 0.4470 0.7410];
            my_color = default_color;
            %
% 			fprintf("Plotting minsingvals")
            scatter(obj.res_minsingvals, 0, sz, my_color )
            title("Min singvals, m=" + string(obj.m))
        end

        function obj = generate_res(obj, m, N)
            % Generate results for a given size of matrix and sample size
%             Input: 
%               m: positive integer -- size of a matrix.
%               N: positive integer -- size of sample.
%               Effect:
%                 generate experiment results for the input m
%                 write them to properties 
%                 res_eigvals, res_2norms, res_specrad, and res_minsingvals.
            %-------------------------------%
            
            % update m
            obj.m = m;

            % generate and write results
            [...
                obj.res_eigvals, ... eigenvalues
                obj.res_specrad, ... 2-norms
                obj.res_2norms, ... spectral radiuses
                obj.res_minsingvals ... minimal singular values
            ] = my_results(m, N);
        end
        function obj = add_new_res(obj, N)
            % Generate more results for an already set size of matrix and a given sample size
%             Input: 
%               N: positive integer -- size of sample.
%               Effect:
%                 generate experiment results for the already set m
%                 write them to properties
%                 res_eigvals, res_2norms, res_specrad, and res_minsingvals.
            %-------------------------------%
            
            % get m
            % m = obj.m; % actually we do not use m and simply write obj.m
            % where m would be used

            %%% generate new results
            [...
                temp_all_eigvals, ... eigenvalues
                temp_all_specrads, ... spectral radiuses
                temp_all_twonorm,... 2-norms
                temp_all_smallest_singval ... minimal singular values
            ] = my_results(obj.m, N);
            %%% add new results to existing results
            % eigenvalues
            obj.res_eigvals = [obj.res_eigvals, temp_all_eigvals] ;

            % spectral radiuses
            obj.res_specrad = [obj.res_specrad, temp_all_specrads] ;
            
            % 2-norms
            obj.res_2norms = [obj.res_2norms, temp_all_twonorm];

            % minimal singular values
            obj.res_minsingvals = [obj.res_minsingvals, temp_all_smallest_singval] ;
            
        end
    end
end