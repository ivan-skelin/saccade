

count=1;
for i = 1:numel(labels)

    tic

    curr_ch = labels{i};

    load(sprintf('%s',curr_ch));


    data_prep.trial{1}(count,:) = Samples(1:(srate/1000):end);


    data_prep.label{count} = char(curr_ch);
    count=count+1;

    toc

end



data_prep.nSamples = numel(Samples)/(srate/1000);

data_prep.fsample = srate/(srate/1000);%ch.freq;


data_prep.time{1} = 1/data_prep.fsample:1/data_prep.fsample:20000;

data_prep.time{1} = data_prep.time{1}(1:data_prep.nSamples);


data_prep.nChans = count - 1;

data_prep.nTrials = 1;

curr_dir=pwd;
cd C:\Users\ivans\Downloads\code\fieldtrip-20230118\fieldtrip-20230118; ft_defaults;
cd(curr_dir);


cfg = [];

cfg.continuous  = 'yes' ;

cfg. viewmode   = 'vertical';

cfg.blocksize = 10; % ten seconds time window

cfg.artfctdef.reject = 'complete';

cfg.selectfeature = 'artifact';

cfg.artfctdef.Rartifact.artifact = [];

cfg.artfctdef.Lartifact.artifact = [];

cfg.artfctdef.artifact.artifact = [];

cfg = ft_databrowser(cfg, data_prep);

artf = cfg.artfctdef.Rartifact.artifact; %n of artifacts x 2 matrix. i,1 and i,2 are the start and end timestamp of the i-th artifact.

save('artf','artf')











