count=0
for i = 1:size(saccade,1)
    tic
    curr_coord_end = [saccade.end_x(i) saccade.end_y(i)];
    
    for ii = 1:size(saccade,1)
        if strcmp(saccade.patient_id(i),saccade.patient_id(ii))==1 && (saccade.scene_id(i) - saccade.scene_id(ii))==0 && ii > i
            
            curr_coord_start2 = [saccade.start_x(ii) saccade.start_y(ii)];
            curr_coord_end2 = [saccade.end_x(ii) saccade.end_y(ii)];
            eucl_dist = sqrt(sum((curr_coord_end-curr_coord_end2).^2));
            eucl_dist2 = sqrt(sum((curr_coord_end-curr_coord_start2).^2));
          %  eucl_dist = pdist([curr_coord,curr_coord2]);
            if eucl_dist<150 & eucl_dist2 > 150
                saccade.return150pix(ii) = 1;
                count = count+1
                i
               
            end
        end
    end
   toc
end

