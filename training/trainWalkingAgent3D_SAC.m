%% SET UP ENVIRONMENT
% Speedup options
useFastRestart = true;
useGPU = true;
useParallel = true;

% Create the observation info
numObs = 43; %33 +10 of prev actions
obsInfo = rlNumericSpec([numObs 1]);
obsInfo.Name = 'observations';

% create the action info
numAct = 10;
low_lims = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1]';
upp_lims = [1 1 1 1 1 1 1 1 1 1 ]';

actInfo = rlNumericSpec([numAct 1],'LowerLimit',low_lims,'UpperLimit', upp_lims);
actInfo.Name = 'applied voltages';
% Environment
mdl = 'walkingRobotRL3D';
load_system(mdl);
blk = [mdl,'/RL Agent'];
env = rlSimulinkEnv(mdl,blk,obsInfo,actInfo);
env.ResetFcn = @(in)walkerResetFcn(in,upper_leg_length,lower_leg_length,h,'3D');
if ~useFastRestart
   env.UseFastRestart = 'off';
end
%% Create the actor and critic networks using the createNetworks helper function
createSCANetworks;
%% Specify options for the critic and actor representations using rlRepresentationOptions
criticOptions = rlRepresentationOptions('Optimizer','adam','LearnRate',1e-3,... 
                                        'GradientThreshold',1,'L2RegularizationFactor',2e-4);
actorOptions = rlRepresentationOptions('Optimizer','adam','LearnRate',1e-3,...
                                       'GradientThreshold',1,'L2RegularizationFactor',1e-5);
if useGPU
   actorOptions.UseDevice = 'gpu'; 
   criticOptions.UseDevice = 'gpu';
end
%% Create critic and actor representations using specified networks and
% options
critic1 = rlQValueRepresentation(criticNetwork1,obsInfo,actInfo,'Observation',{'observation'},'Action',{'action'},criticOptions);
critic2 = rlQValueRepresentation(criticNetwork2,obsInfo,actInfo,'Observation',{'observation'},'Action',{'action'},criticOptions);
%actor  = rlStochasticActorRepresentation(actorNetwork,obsInfo,actInfo,'Observation',{'observation'},'Action',{'ActorTanh1'},actorOptions);
%actor  = rlStochasticActorRepresentation(actorNetwork,obsInfo,actInfo,'Observation',{'observation'},actorOptions);
actor  = rlStochasticActorRepresentation(actorNetwork,obsInfo,actInfo,'Observation','observation',actorOptions);
%% Specify SAC agent options
agentOptions = rlSACAgentOptions;
agentOptions.SampleTime = Ts;
agentOptions.DiscountFactor = 0.99;
agentOptions.MiniBatchSize = 256;
agentOptions.ExperienceBufferLength = 1e6;
agentOptions.TargetSmoothFactor = 5e-3;
%agentOptions.TargetPolicySmoothModel.Variance = 0.2; % target policy noise
%agentOptions.TargetPolicySmoothModel.LowerLimit = -0.5;
%agentOptions.TargetPolicySmoothModel.UpperLimit = 0.5;
%agentOptions.ExplorationModel = rl.option.OrnsteinUhlenbeckActionNoise; % set up OU noise as exploration noise (default is Gaussian for rlTD3AgentOptions)
%agentOptions.ExplorationModel.MeanAttractionConstant = 1;
%agentOptions.ExplorationModel.Variance = 0.1;
%% Create agent using specified actor representation, critic representations and agent options
agent = rlSACAgent(actor, [critic1,critic2], agentOptions);
%% Training Options
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
%% Train agent
% Set ResetExperienceBufferBeforeTraining to false to keep experience from the previous session
resumeTraining = false;
agentOptions.ResetExperienceBufferBeforeTraining = ~(resumeTraining);
trainingResults = train(agent,env,trainingOptions)
%% SAVE AGENT
reset(agent); % Clears the experience buffer
curDir = pwd;
saveDir = 'savedAgentsSAC';
cd(saveDir)
save(['trainedAgent_3D_' datestr(now,'mm_DD_YYYY_HHMM')],'agent');
%save(['trainingResults_3D_'
%datestr(now,'mm_DD_YYYY_HHMM')],'trainingResults'); % Too big to store
cd(curDir)