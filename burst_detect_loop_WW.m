


addpath C:\Users\ivans\Downloads\code;

filelist = ls;
load trial_limits_ind.mat;
load keep_ind;

eeg_curr_trial_end_ind_keep = eeg_curr_trial_end_ind(find(keep_ind==1));
eeg_curr_trial_start_ind_keep = eeg_curr_trial_start_ind(find(keep_ind==1));

image_ind_keep = image_ind(find(keep_ind==1));

for i = 1:size(filelist,1)

if contains(filelist(i,:),'ds_ref')
load(sprintf('%s',filelist(i,:)));


Fs = freq;
threshold = 2;
wFreq = [1:80]; 
n_wavelets = 7;

for k = 1:numel(eeg_curr_trial_start_ind_keep)
trace = ch_highpass_cleaned((eeg_curr_trial_start_ind_keep(k) - (freq*4)):(eeg_curr_trial_end_ind_keep(k) + (freq*3)));
 [wFreq, tfdata] = mywavelet(trace, Fs, n_wavelets, wFreq);

TFR=abs(tfdata(:,(freq*3):(freq*8)));
TFR_z = zscore(TFR,[],2);

[burst_raster{k},peak_raster{k},frq_peak_raster{k},burst_freq{k},burst_tp{k}] = extract_burst_from_TFR(TFR_z, wFreq,Fs,[], threshold);



end

dot_position = find(filelist(i,:)=='.');
save(sprintf('bursts_%s',filelist(i,1:(dot_position-1))),'burst_raster','peak_raster','frq_peak_raster','burst_freq','burst_tp','-v7.3');
clear burst_raster peak_raster frq_peak_raster burst_tp burst_freq;

toc
end
end
   
