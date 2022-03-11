% Plot robot trajectory of the 10 experiments with DDPG, TD3 and SAC
%% Load TD3 agents 
sim1_a4210 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim1_a4210.mat');
sim2_a4537 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim2_a4537.mat');
sim3_a4186 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim3_a4186.mat');
sim4_a4169 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim4_a4169.mat');
sim5_a4830 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim5_a4830.mat');
sim6_a4558 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim6_a4558.mat');
sim7_a4171 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim7_a4171.mat');
sim8_a4893 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim8_a4893.mat');
sim9_a4507 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim9_a4507.mat');
sim10_a4784 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim10_a4784.mat');
%% Plot TD3 agents trajectory
% Trajectory
x1 = sim1_a4210.simout.X.Data;
y1 = sim1_a4210.simout.Y.Data;
x2 = sim2_a4537.simout.X.Data;
y2 = sim2_a4537.simout.Y.Data;
x3 = sim3_a4186.simout.X.Data;
y3 = sim3_a4186.simout.Y.Data;
x4 = sim4_a4169.simout.X.Data;
y4 = sim4_a4169.simout.Y.Data;
x5 = sim5_a4830.simout.X.Data;
y5 = sim5_a4830.simout.Y.Data;
x6 = sim6_a4558.simout.X.Data;
y6 = sim6_a4558.simout.Y.Data;
x7 = sim7_a4171.simout.X.Data;
y7 = sim7_a4171.simout.Y.Data;
x8 = sim8_a4893.simout.X.Data;
y8 = sim8_a4893.simout.Y.Data;
x9 = sim9_a4507.simout.X.Data;
y9 = sim9_a4507.simout.Y.Data;
x10 = sim10_a4784.simout.X.Data;
y10 = sim10_a4784.simout.Y.Data;
% Lines 
Y_margin = 1;
Y_margin_x = 0:0.01:14;
Y_margin1 = 0.5;
figure
line_spect = '-';
plot(y1,x1,line_spect,y2,x2,line_spect,y3,x3,line_spect,...
    y4,x4,line_spect,y5,x5,line_spect,y6,x6,line_spect,...
    y7,x7,line_spect,y8,x8,line_spect,y9,x9,line_spect,y10,x10,line_spect)
hold on
plot(Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(zeros(length(Y_margin_x)),Y_margin_x,'k','LineWidth',2)
limits = [-2.5 2.5 0 15];
axis(limits)
title('Trayectorias del robot entrenado con TD3')
xlabel('Desviación lateral (m)')
ylabel('Avance (m)')
legend('sim1','sim2','sim3','sim4','sim5','sim6','sim7','sim8','sim9','sim10');

%% Load DDPG agents
sim1_a4082 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim1_a4082.mat');
sim2_a4118 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim2_a4118.mat');
sim3_a4100 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim3_a4100.mat');
sim4_a3564 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim4_a3564.mat');
sim5_a4143 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim5_a4143.mat');
sim6_a3580 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim6_a3580.mat');
sim7_a4107 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim7_a4107.mat');
sim8_a4092 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim8_a4092.mat');
sim9_a4209 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim9_a4209.mat');
sim10_a3595 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim10_a3595.mat');

%% Plot DDPG agents trajectory
% Trajectory
x1 = sim1_a4082.simout.X.Data;
y1 = sim1_a4082.simout.Y.Data;
x2 = sim2_a4118.simout.X.Data;
y2 = sim2_a4118.simout.Y.Data;
x3 = sim3_a4100.simout.X.Data;
y3 = sim3_a4100.simout.Y.Data;
x4 = sim4_a3564.simout.X.Data;
y4 = sim4_a3564.simout.Y.Data;
x5 = sim5_a4143.simout.X.Data;
y5 = sim5_a4143.simout.Y.Data;
x6 = sim6_a3580.simout.X.Data;
y6 = sim6_a3580.simout.Y.Data;
x7 = sim7_a4107.simout.X.Data;
y7 = sim7_a4107.simout.Y.Data;
x8 = sim8_a4092.simout.X.Data;
y8 = sim8_a4092.simout.Y.Data;
x9 = sim9_a4209.simout.X.Data;
y9 = sim9_a4209.simout.Y.Data;
x10 = sim10_a3595.simout.X.Data;
y10 = sim10_a3595.simout.Y.Data;
% Lines 
Y_margin = 1;
Y_margin_x = 0:0.01:14;
Y_margin1 = 0.5;
figure
line_spect = '-';
plot(y1,x1,line_spect,y2,x2,line_spect,y3,x3,line_spect,...
    y4,x4,line_spect,y5,x5,line_spect,y6,x6,line_spect,...
    y7,x7,line_spect,y8,x8,line_spect,y9,x9,line_spect,y10,x10,line_spect)
hold on
plot(Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(zeros(length(Y_margin_x)),Y_margin_x,'k','LineWidth',2)
limits = [-2.5 2.5 0 15];
axis(limits)
title('Trayectorias del robot entrenado con DDPG')
xlabel('Desviación lateral (m)')
ylabel('Avance (m)')
legend('sim1','sim2','sim3','sim4','sim5','sim6','sim7','sim8','sim9','sim10');

%% Load SAC agents
sim1_a4444 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim1_a4444.mat');
sim2_a1904 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim2_a1904.mat');
sim3_a1920 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim3_a1920.mat');
sim4_a1922 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim4_a1922.mat');
sim5_a2025 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim5_a2025.mat');
sim6_a2062 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim6_a2062.mat');
sim7_a2073 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim7_a2073.mat');
sim8_a2084 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim8_a2084.mat');
sim9_a2088 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim9_a2088.mat');
sim10_a2102 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim10_a2102.mat');
%% Plot SAC agents trajectories
% Trajectory
x1 = sim1_a4444.simout.X.Data;
y1 = sim1_a4444.simout.Y.Data;
x2 = sim2_a1904.simout.X.Data;
y2 = sim2_a1904.simout.Y.Data;
x3 = sim3_a1920.simout.X.Data;
y3 = sim3_a1920.simout.Y.Data;
x4 = sim4_a1922.simout.X.Data;
y4 = sim4_a1922.simout.Y.Data;
x5 = sim5_a2025.simout.X.Data;
y5 = sim5_a2025.simout.Y.Data;
x6 = sim6_a2062.simout.X.Data;
y6 = sim6_a2062.simout.Y.Data;
x7 = sim7_a2073.simout.X.Data;
y7 = sim7_a2073.simout.Y.Data;
x8 = sim8_a2084.simout.X.Data;
y8 = sim8_a2084.simout.Y.Data;
x9 = sim9_a2088.simout.X.Data;
y9 = sim9_a2088.simout.Y.Data;
x10 = sim10_a2102.simout.X.Data;
y10 = sim10_a2102.simout.Y.Data;
% Lines 
Y_margin = 1;
Y_margin_x = 0:0.01:14;
Y_margin1 = 0.5;
figure
line_spect = '-';
plot(y1,x1,line_spect,y2,x2,line_spect,y3,x3,line_spect,...
    y4,x4,line_spect,y5,x5,line_spect,y6,x6,line_spect,...
    y7,x7,line_spect,y8,x8,line_spect,y9,x9,line_spect,y10,x10,line_spect)
hold on
plot(Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(zeros(length(Y_margin_x)),Y_margin_x,'k','LineWidth',2)
limits = [-2.5 2.5 0 15];
axis(limits)
title('Trayectorias del robot entrenado con SAC')
xlabel('Desviación lateral (m)')
ylabel('Avance (m)')
legend('sim1','sim2','sim3','sim4','sim5','sim6','sim7','sim8','sim9','sim10');

%% Plot best trajectories comparison
sim1_a4210 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\TD3\sim1_a4210.mat');
sim3_a4100 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\DDPG\sim3_a4100.mat');
sim4_a1922 = load('C:\Users\eri53\Desktop\MASTER IA\TFM\Trainings\Experimento\SAC\sim4_a1922.mat');

x1 = sim3_a4100.simout.X.Data;
y1 = sim3_a4100.simout.Y.Data;
x2 = sim1_a4210.simout.X.Data;
y2 = sim1_a4210.simout.Y.Data;
x3 = sim4_a1922.simout.X.Data;
y3 = sim4_a1922.simout.Y.Data;
% Lines 
Y_margin = 1;
Y_margin_x = 0:0.01:14;
Y_margin1 = 0.5;
figure
line_spect = '-';
plot(y1,x1,line_spect,y2,x2,'-g',y3,x3,line_spect,'LineWidth',1.5)
hold on
plot(Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin*ones(length(Y_margin_x)),Y_margin_x,'r','LineWidth',2)
hold on
plot(-Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(Y_margin1*ones(length(Y_margin_x)),Y_margin_x,'--r','LineWidth',1.5)
hold on
plot(zeros(length(Y_margin_x)),Y_margin_x,'k','LineWidth',2)
limits = [-2.5 2.5 0 15];
axis(limits)
title('Comparación de trayectorias')
xlabel('Desviación lateral (m)')
ylabel('Avance (m)')
legend('DDPG agent','TD3 agent','SAC agent');