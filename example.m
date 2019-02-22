tic
clear,clc

time_step = 0.01;  % Temporal precision (slow, but best at ~0.001s; faster but worse at higher steps)
t = -7:time_step:6; % Time vector
pertStart = 7/time_step;   % Usually >>1 to let model initialize
numSims = 4;       % Number of simulations to run in parallel

% Initialize controlled length trajectories for all simulaitons - must be
% same shape:
delta_cdl = zeros(numSims,numel(t)); 
% Initialize controlled intrafusal activation changes:
delta_f_activated = zeros(numSims,numel(t));

% Specify base value of parameter that may change in each loop. In this 
% case, we want to vary the duration of the ramp phase of stretch:
strDur = 0.6/time_step;

% length scaling factor to account for pinnation & elastic attachment of 
% fibers:
lsf = 0.8; 

% Populate the controlled variables - this example uses piecewise
% operations:
for a = 1:numSims
    for i = 1:numel(t)
        if i == 1
            delta_f_activated(a,i) = 0.3;
        elseif i > pertStart && i < pertStart + strDur/a
            delta_cdl(a,i) = 118.2*a*lsf*time_step;
        elseif i > pertStart + strDur/a + 1/time_step && i < pertStart + 2*(strDur/a) + 1/time_step
            delta_cdl(a,i) = -118.2*a*lsf*time_step;
        end
    end
end

% Use MATLAB's built-in parallel computing to run simulations and store
% data: 
parfor a = 1:numSims
    [hsB(a),dataB(a),hsC(a),dataC(a)] = sarcSimDriver(t,delta_f_activated(a,:),delta_f_activated(a,:),delta_cdl(a,:));
    disp(['Done with simulation number ' num2str(a)])
end

toc;
hold on; plotyy(dataB(1).t,dataB(1).hs_force,dataC(1).t,dataC(1).hs_force)

[r,rd,rs] = sarc2spindle(dataB(4),dataC(4),1,1,0.03,1,0);
figure
hold on;
plot(dataB(4).t,r); plot(dataB(4).t,rd); plot(dataB(4).t,rs)