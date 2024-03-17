




curr_time = 0;
count=1;step_size = 5;
for j = 1:5:size(t_bins_sorted,2)
    
    tic
%      if j < 41
%     img = imread('img_present.png');
%     epoch = 'choice epoch';
%     elseif j>=41
%          img = imread('feedb.GIF');
%          epoch = 'feedback epoch';
%      end
    
    figure;
  
   
   
   hold on, 
   
%mesh_r=load('\\mycloudpr4100\ivan\Ivan_analysis\Ivan\glass_brain\glass_brain\surface_pial_right.mat');
mesh_r=load('C:\Users\ivans\Downloads\code\fieldtrip-20230118\fieldtrip-20230118\template\anatomy\surface_pial_right.mat');

       ft_plot_mesh(mesh_r.mesh);
   alpha(0.1)
   view([122 4]);
    %view([-72 -18])
    
    for jj = 1:size(PEV_act_all,1)
  
 
 
 curr_HG_value_ipsi = PEV_act_all(jj,j);
  
  curr_elecpos_ipsi = elecpos_sig(jj,:);
  
%   curr_elecpos = cell2mat(curr_elecpos);
%   
    %range = [0 1];
  %if curr_HG_value_ipsi==1 

map = [1-curr_HG_value_ipsi 1-curr_HG_value_ipsi 1-curr_HG_value_ipsi];


   scatter3(abs(curr_elecpos_ipsi(1)),curr_elecpos_ipsi(2),curr_elecpos_ipsi(3),28,map,'filled', 'MarkerEdgeColor','k');
   colormap('gray'); colormap_new = flipud(colormap);
   colormap(colormap_new);caxis([0 1]);
 
 colorbar;colorbar('Ticks',[0,1],...
         'TickLabels',{'min','max'})
   
    
    end
       
   % title('ipsi','fontsize',14); 
    dim = [.37 .70 .3 .3];
str = sprintf('%d  msec',curr_time); curr_time = curr_time + (step_size*10);
annotation('textbox',dim,'LineStyle','none','String',str,'FitBoxToText','on','fontsize',15);camlight;

dim = [.87 .3 .3 .3];
str = 'feedb EV'; curr_time = curr_time + 10;
annotation('textbox',dim,'LineStyle','none','String',str,'FitBoxToText','on','fontsize',10);
  camlight;



hold off;
 
    F(count) = getframe(gcf);
   % video = VideoWriter('HGA_glass_brain_sig_contra_ipsi_resh_lat_view_new.avi','Uncompressed AVI');
    pause(0.01);
    close all;
   toc
count=count+1;
end


video = VideoWriter('HGA_glass_brain_feedback_EV_no_slide_test_mpeg','MPEG-4');

video.FrameRate = 1;
open(video);
writeVideo(video, F);

close(video);

close all;

% 
% figure;subplot(3,2,1);pie([88.6 100-88.6]);colormap('gray');subplot(3,2,3);pie([67.6 100-67.6]);colormap('gray');subplot(3,2,5);pie([15.1 100-15.1]);colormap('gray');
% subplot(3,2,2);pie([30.2 100-30.2]);colormap('gray');subplot(3,2,4);pie([19.2 100-19.2]);colormap('gray');subplot(3,2,6);pie([12.2 100-12.2]);colormap('gray');
% 
% 


