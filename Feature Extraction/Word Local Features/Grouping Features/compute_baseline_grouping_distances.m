function [ distances ] = compute_baseline_grouping_distances( Word , baseline_coefs )


   Word = convert_word_to_a_new_tracking_type( Word, 'ON_TABLET' );

    if(nargin < 2) 
        if(strcmp(Word.ContentType,'LINE'))
            baseline_coefs = compute_baseline_estimate( Word , 1 , true );
        end
        if(strcmp(Word.ContentType,'WORD'))
            baseline_coefs = compute_baseline_estimate( Word , 0 , true );
        end
    end
    
    

    [ counter , crossing_points ] = compute_number_of_strokes_passing_through_corpus( Word , 'ON_TABLET' , baseline_coefs ); 

    distances = [];

    if( counter > 1 )  
        [ ~ , Indexes ] = sort([ crossing_points.X ]);
        crossing_points = crossing_points(Indexes);
        for k=1:counter-1
            dist_consec_points = sqrt((crossing_points(k).X - crossing_points(k+1).X).^2 + (crossing_points(k).Y - crossing_points(k+1).Y).^2);
            distances = [distances; dist_consec_points];
        end
    end

end