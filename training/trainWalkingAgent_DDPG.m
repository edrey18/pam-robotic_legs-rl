%% SET UP ENVIRONMENT
% Speedup options
useFastRestart = true;
useGPU = true;
useParallel = true;

% Create the observation info
numObs = 43; %33 +20 of prev actions
%numObs = 33; 
observationInfo = rlNumericSpec([numObs 1]);
observationInfo.Name = 'observations';

% create the action info
numAct = 10;

% low_lims = [1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4]';
% upp_lims = [3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3]';

low_lims = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1]';
upp_lims = [1 1 1 1 1 1 1 1 1 1 ]';

actionInfo = rlNumericSpec([numAct 1],'LowerLimit',low_lims,'UpperLimit', upp_lims);
actionInfo.Name = 'applied voltages';
% Environment
mdl = 'walkingRobotRL3D';
load_system(mdl);
blk = [mdl,'/RL Agent'];
env = rlSimulinkEnv(mdl,blk,observationInfo,actionInfo);
env.ResetFcn = @(in)walkerResetFcn(in,upper_leg_length,lower_leg_length,h,'3D');
if ~useFastRestart
   env.UseFastRestart = 'off';
end

%% CREATE NEURAL NETWORKS
createDDPGNetworks;
                     
%% CREATE AND TRAIN AGENT (Adapted to train pretrained agent)-> Variances should be decreased manually
% DDPG Agent Options
agentOptions = rlDDPGAgentOptions;
agentOptions.SampleTime = Ts;
agentOptions.DiscountFactor = 0.99; %0.99;
agentOptions.MiniBatchSize = 128;
agentOptions.ExperienceBufferLength = 5e5; %Increase this from 5e5 to 1e7->Out of memory error
%agentOptions.SaveExperienceBufferWithAgent = true; %To save experience in
%order to train pretrained / commented to check memory leak
agentOptions.TargetSmoothFactor = 1e-3;
agentOptions.NoiseOptions.MeanAttractionConstant = 5;
agentOptions.NoiseOptions.Variance = 0.5; %0.5
agentOptions.NoiseOptions.VarianceDecayRate = 1e-5;

% Training Options
trainingOptions = rlTrainingOptions;
trainingOptions.MaxEpisodes = 5000;
trainingOptions.MaxStepsPerEpisode = Tf/Ts;
trainingOptions.ScoreAveragingWindowLength = 100;
%trainingOptions.StopTrainingCriteria = 'AverageReward';
%trainingOptions.StopTrainingValue = 200;
trainingOptions.SaveAgentCriteria = 'EpisodeReward';
trainingOptions.SaveAgentValue = 350;
trainingOptions.Plots = 'training-progress';
trainingOptions.Verbose = true;
if useParallel
    trainingOptions.Parallelization = 'async';
    trainingOptions.ParallelizationOptions.StepsUntilDataIsSent = 32;
end

% Set to true, to resume training from a saved agent
resumeTraining = false;
% Set ResetExperienceBufferBeforeTraining to false to keep experience from the previous session
agentOptions.ResetExperienceBufferBeforeTraining = ~(resumeTraining);
if resumeTraining
    % Load agent from previous section (You need to save in the folder with
    % the proper name: pre_trained_model
   % saved_agent = load('preTrained\pre_trained_model.mat');
   saved_agent = load('/home/student/TFM/RL-Walking Robot 10 DoF-20200604T081850Z-001/RL-Walking Robot 10 DoF/preTrained/pre_trained_model.mat');
    agent = saved_agent.agent;
    sprintf('- Resume training of the pre trained agent');
else   
    % Create new agent
    agent = rlDDPGAgent(actor,critic,agentOptions);
end
trainingResults = train(agent,env,trainingOptions)

%% SAVE AGENT
reset(agent); % Clears the experience buffer
curDir = pwd;
saveDir = 'savedAgents';
cd(saveDir)
save(['trainedAgent_3D_' datestr(now,'mm_DD_YYYY_HHMM')],'agent');
%save(['trainingResults_3D_'
%datestr(now,'mm_DD_YYYY_HHMM')],'trainingResults'); % Too big to store
cd(curDir)