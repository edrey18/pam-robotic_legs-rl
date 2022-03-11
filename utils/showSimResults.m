%% Code for getting 10 better agents
%[max_value index]= maxk(trainingResults.EpisodeReward,10)
%% Add the rewards to the simout struct
simout.rewards = rewards;
%% Print the results for the experiment
time = max(simout.rewards.Time)
distance = simout.X.Data(end)
vm = distance/time
end_lateral_deviation = abs(simout.Y.Data(end))
reward = sum(simout.rewards.Data)

