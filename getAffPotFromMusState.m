function trial_data = getAffPotFromMusState(trial_data,params)



% TODOs
% EMG normalization?
% Muscle length normalization?
% 

emgInd = find(strcmp(params.emgName,td_s(1).emg_names));
musInd = find(strcmp(params.musName,td_s(1).muscle_names));



%%%%%%%%%%%%%%%%
numSims = numel(trial_data);       % Number of simulations to run in parallel



parfor a = 1:numSims
% Take out relevant data from trial a and pad so model can initialize
t = (0:trial_data(a).bin_size:trial_data(a).idx_endTime)';
delta_gammaD = trial_data(a).;
delta_gammaS = [];
delta_cdl = [];

    
    
    
% Use MATLAB's built-in parallel computing to run simulations and store
% data: 
    [hsB(a),dataB(a),hsC(a),dataC(a)] = sarcSimDriver(t,delta_gammaD,delta_gammaS,delta_cdl(a,:));
    [r(a),~,~] = sarc2spindle(dataB(a),dataC(a),1,1,0.03,1,0.09);
    disp(['Done with simulation number ' num2str(a)])
end
