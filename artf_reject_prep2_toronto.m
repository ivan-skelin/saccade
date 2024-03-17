% 
% a = FindFiles('*.mat');
% 
% count=1;
% for i = 1:numel(all_labels)
% 
%     tic
%     curr_ch = all_labels{i};
% 
%     if contains(curr_ch, 'u')==0
% 
%         load(sprintf('%s',curr_ch));
% 
%     %data_prep.trial{1}(i,:) = data.trial{1}(j,:);
%     srate=2000;
%      data_prep.trial{1}(count,:) = Samples(1:(srate/1000):end);
% 
% 
%     data_prep.label{count} = curr_ch;
%     count=count+1;
%     end
%     toc
% 
% end

count=1;
for i = 1:numel(labels)
    
    tic
    %curr_ch = labels(i).ch{1};
curr_ch = labels{i};
   
        load(sprintf('%s',curr_ch));
  
    %data_prep.trial{1}(i,:) = data.trial{1}(j,:);
    %srate=4000;
     data_prep.trial{1}(count,:) = Samples(1:(srate/1000):end);
    
    %data_prep.label{count} = curr_ch;
    data_prep.label{count} = char(curr_ch);
    count=count+1;
    
    toc
    
end


% for i = 1:numel(label)
% 
%     tic
%     curr_ch = label{i};
%     for j = 1:numel(header.channel_labels)
% 
%         curr_ch2 = header.channel_labels{j};
%       %  curr_ch2([1:4 ((end-3):end)])=[];
% 
% 
%     if strcmp(curr_ch,curr_ch2)==1
% 
% 
%     %data_prep.trial{1}(i,:) = data.trial{1}(j,:);
% 
%      data_prep.trial{1}(i,:) = data(j,:);
% 
% 
%     data_prep.label{i} = curr_ch;
%     end
%     end
%     toc
% 
% end
% 
% 
% 
% for i = 1:numel(label)
% 
%     tic
%     curr_ch = label{i};
%     for j = 1:numel(data.label)
% 
%         curr_ch2 = data.label{j};
%       %  curr_ch2([1:4 ((end-3):end)])=[];
% 
% 
%     if strcmp(curr_ch,curr_ch2)==1
% 
% 
%     %data_prep.trial{1}(i,:) = data.trial{1}(j,:);
% 
%      data_prep.trial{1}(i,:) = data.trial{1}(j,:);
% 
% 
%     data_prep.label{i} = curr_ch;
%     end
%     end
%     toc
% 
% end
% 
% 
% 
% for i = 1:numel(label)
% 
%     tic
%     curr_ch = label{i};
% 
%     load(sprintf('%s_0004',curr_ch));
% 
%      data_prep.trial{1}(i,:) = ch.lfp;
% 
%     %data_prep.trial{1}(i,:) = Samples;
%     data_prep.label{i} = curr_ch;
% 
% 
%     toc
% 
% end











% count=1;
% for i = 1:numel(channel_clean)
%     curr_ch=channel_clean(i).Name;
%     
%     for j = 1:numel(channel)
%         
%         curr_ch2 = channel(j).Name;
%         if strcmp(curr_ch,curr_ch2)==1
%     
%     sel_ind(count)=j; count=count+1;
%         end
%     end
%     
%     
% end
% 
% size_aa = size(aa,1);
% 
% for i = 1:numel(sel_ind)
%     
%     
%     curr_sel = sel_ind(i);
%     curr_ch = channel_clean(i).Name;
%     
%      tic
%    
%    aa =  data_adjust(curr_sel,1:450000);
%     
%     data.trial{1}(i+39,:) = aa;
%     
%     
%     
%     data.label{i+39} = curr_ch;
%     end
%    
%     
 

%data_prep.nSamples = numel(Samples);
%data_prep.nSamples = numel(ch.lfp);
%data_prep.nSamples =size(ch.trial{1},2);

data_prep.nSamples = numel(Samples)/(srate/1000); 

data_prep.fsample = srate/(srate/1000);%ch.freq;
%data_prep.fsample = data.fsample;
% data_prep.fsample = data.hdr.Fs;
% data_prep.fsample = srate;

data_prep.time{1} = 1/data_prep.fsample:1/data_prep.fsample:20000;

data_prep.time{1} = data_prep.time{1}(1:data_prep.nSamples);



data_prep.nChans = count - 1;
%data_prep.nChans = numel(data_prep.label);

data_prep.nTrials = 1;

curr_dir=pwd;
cd C:\Users\ivans\Downloads\code\fieldtrip-20230118\fieldtrip-20230118; ft_defaults;
cd(curr_dir);

%subjectid = 'IRXX';

cfg = []; 

cfg.continuous  = 'yes' ;

cfg. viewmode   = 'vertical';

%cfg.ylim = [-0.000350 0.000350]; % similar to the clinical browser with sensitivity of 75uV

cfg.blocksize = 10; % ten seconds time window

cfg.artfctdef.reject = 'complete';

cfg.selectfeature = 'artifact';

cfg.artfctdef.Rartifact.artifact = [];

cfg.artfctdef.Lartifact.artifact = [];

cfg.artfctdef.artifact.artifact = [];

cfg = ft_databrowser(cfg, data_prep);

artf = cfg.artfctdef.Rartifact.artifact; %n of artifacts x 2 matrix. i,1 and i,2 are the start and end timestamp of the i-th artifact.

save('artf','artf')











