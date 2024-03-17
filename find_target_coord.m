
%there is a total of 4 targets per image. they seem to come in 3 different
%sizes

A = imread('scene 1 target 1plc4.png');
figure;imagesc(A(:,:,1));hold on;scatter(target_seed1{2}(2),target_seed1{2}(1),'r*')


template1 = A(226:228,246:248,:);
246, 226
template2 = A(807:809,942:944,:);
942, 807
figure;imagesc(A(:,:,1));hold on;scatter(target_seed2{1}(2),target_seed2{1}(1),'r*')

figure;imagesc(A(:,:,1));hold on;scatter(target_seed3{1}(2),target_seed3{1}(1),'r*')
1346, 484
template3 = A(484:486,1346:1348,:);

602, 648
template4 = A(648:651,602:603,:);

count=1;
for i = 1:(size(A,1)-6)
    tic
    for ii = 1:(size(A,2)-3)
        seed = [i,ii];
        match = A(i:i+2,ii:ii+2,:);

        seed_vec = template1(:);
        match_vec = match(:);

        if isequal(seed_vec,match_vec)==1
            target_seed1{count} = [i,ii]; count=count+1;

        end
    end
    toc
end

count=1;
for i = 1:(size(A,1)-6)
    tic
    for ii = 1:(size(A,2)-3)
        seed = [i,ii];
        match = A(i:i+2,ii:ii+2,:);

        seed_vec = template2(:);
        match_vec = match(:);

        if isequal(seed_vec,match_vec)==1
            target_seed2{count} = [i,ii]; count=count+1;

        end
    end
    toc
end




count=1;
for i = 1:(size(A,1)-6)
    tic
    for ii = 1:(size(A,2)-3)
        seed = [i,ii];
        match = A(i:i+2,ii:ii+2,:);

        seed_vec = template3(:);
        match_vec = match(:);

        if isequal(seed_vec,match_vec)==1
            target_seed3{count} = [i,ii]; count=count+1;

        end
    end
    toc
end


% 
% count=1;
% for i = 1:(size(A,1)-6)
%     tic
%     for ii = 1:(size(A,2)-3)
%         seed = [i,ii];
%         match = A(i:i+3,ii:ii+1,:);
% 
%         seed_vec = template4(:);
%         match_vec = match(:);
% 
%         if isequal(seed_vec,match_vec)==1
%             target_seed4{count} = [i,ii]; count=count+1;
% 
%         end
%     end
%     toc
% end

load templates_target1;
load templates_target2;

for x = 1:numel(stimulus)
    curr_stimulus = stimulus(x).stimulus;
    if isempty(strfind(curr_stimulus,'target 1'))==0
        templates = templates_target1;
    else
        templates = templates_target2;
    end

    A = imread(sprintf('%s',stimulus(x).stimulus));

count=1;
for i = 1:(size(A,1)-6)
    
    for ii = 1:(size(A,2)-3)
        seed = [i,ii];
        match = A(i:i+2,ii:ii+2,:);

        seed_vec = templates{1}(:);
        match_vec = match(:);

        if isequal(seed_vec,match_vec)==1
            target_seed1{count} = [i,ii]; count=count+1;

        end
    end
   
end

count=1;
for i = 1:(size(A,1)-6)
    
    for ii = 1:(size(A,2)-3)
        seed = [i,ii];
        match = A(i:i+2,ii:ii+2,:);

        seed_vec = templates{2}(:);
        match_vec = match(:);

        if isequal(seed_vec,match_vec)==1
            target_seed2{count} = [i,ii]; count=count+1;

        end
    end
    
end




count=1;
for i = 1:(size(A,1)-6)
  
    for ii = 1:(size(A,2)-3)
        seed = [i,ii];
        match = A(i:i+2,ii:ii+2,:);

        seed_vec = templates{3}(:);
        match_vec = match(:);

        if isequal(seed_vec,match_vec)==1
            target_seed3{count} = [i,ii]; count=count+1;

        end
    end
   
end

target_coord_all = horzcat(target_seed1, target_seed2, target_seed3);

numel(target_coord_all)

stimulus(x).target_coord = target_coord_all; clear target_seed1 target_seed2 target_seed3 target_coord_all;




end


for i = 1:22%numel(stimulus)
A = imread(sprintf('%s',stimulus(i).stimulus));
figure; imagesc(A(:,:,1));hold on;
for ii = 1:numel(stimulus(i).target_coord)
    s = scatter(stimulus(i).target_coord{ii}(2),stimulus(i).target_coord{ii}(1),'r*')
  
s.SizeData = 200;
end

end

