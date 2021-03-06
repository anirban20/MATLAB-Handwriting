function [ ConvexHull_Spacing ] = compute_horizontal_convexhull_spacing_unidimensional_histogram( Word , n_bins , delimiters_type , hist_type )
%% compute_horizontal_convexhull_spacing_unidimensional_histogram
%  Computes all the unidimensional histogram on a word convex hull spaces
%
%
% [ _ConvexHull_Spacing_ ] = _*compute_horizontal_convexhull_spacing_unidimensional_histogram*_ ( _Word_ , _n_bins_ , _delimiters_type_ , _hist_type_  )
%
%%% Inputs
% 
% * *Word*      : A Word Struct as defined in this framework 
%                 see wordStruct documentation. 
%
% * *n_bins*    : Number of bins for the quantification
%
% * *delimiters_type* : type of delimiters estimators to be used. 
%                       Either 'Percentils' , 'Uniform' , 'Quantification'
%
% * *hist_type* : Type of histogram to be used, either 'Basic' or 'Parzen'
%
%%% Outputs
% 
% * *ConvexHull_Spacing*  : A struct containing all the unidim. statistics parameters.
%


%% Authors and Modification Log
% 
%  Author :     G. Marzinotto (September 2016)
%  Modified by: ---
%%

    space_size_cm  = compute_horizontal_convexhull_spacing( Word );

         
    bin_loader = strcat('Bin_Delimiters_Horizontal_ConvexHull_Spacing_',num2str(n_bins),'bins');
    eval(bin_loader);
    
    delimiters = eval(strcat('Bins.Horizontal_ConvexHull_Spacing.Bins',num2str(n_bins),'.',delimiters_type));
    
    ConvexHull_Spacing  = a_good_histogram_function( space_size_cm , delimiters , hist_type );

    


end