function trial_data = getAffPotFromMusState(trial_data,params)

if ~isfield(params,'gammaMode')
    params.gammaMode = 'const';
end

%%%%%%%%%%%%%%%%% Deal with gamma signals %%%%%%%%%%%%%%%%%%%%%
if strcmp(params.gammaMode,'const')
    gammaS = 0.5;
    gammaD = 0.5;
elseif strcmp(params.gammaMode,'agca')
    % these will be determined point-by-point within the loop
    gammaS = [];
    gammaD = [];
end


%%%%%%%%%%%%%%%%
numSims = numel(trial_data);       % Number of simulations to run in parallel



parfor a = 1:numSims
% Take out relevant data from trial a and pad so model can initialize
t = 0:trial_data(a).bin_size:trial_data.idx_startTime
    
    
    
% Use MATLAB's built-in parallel computing to run simulations and store
% data: 
    [hsB(a),dataB(a),hsC(a),dataC(a)] = sarcSimDriver(t,delta_f_activated(a,:),delta_cdl(a,:));
    [r(a),~,~] = sarc2spindle(dataB(a),dataC(a),1,1,0.03,1,0.09);
    disp(['Done with simulation number ' num2str(a)])
end
