
%% Model parameters
% Mechanical
density = 500;
foot_density = 1000;
if ~exist('actuatorType','var')
    actuatorType = 1;
end
%Introduce body parameters
g = 9.80665; 
BodyRobot

world_damping = 1e-3;
world_rot_damping = 5e-2;
%Body parameters
BodyRobot;
%Plane parameters
height_plane = 0.025;
plane_x = 25;
plane_y = 10;
contact_point_radius = 1e-4; 
     

% Joint parameters
joint_damping = 1;
joint_stiffness = 0;
motion_time_constant = 0.01;
joint_limit_stiffness = 1e4;
joint_limit_damping = 10;

%% Reinforcement Learning (RL) parameters
Ts = 0.025; % Agent sample time
Tf = 10;    % Simulation end time
        
% Scaling factor for RL action [-1 1]
%max_torque = 3;

% Initial conditions
h = upper_leg_length + lower_leg_length + torso_offset_z;     
%init_height = foot_z + h + torso_height + torso_offset_z + height_plane/2;
%init_height = 100*(foot_z/2 + h + torso_offset_z + height_plane);
init_height = 95.45;
%init_height = 100*(foot_z + h + torso_height/2 + height_plane/2);
%Need to put it in cm because where is applied is in cm (but i cant find
%where)-> It's in the reward function
vx0 = 0;    % Initial X linear velocity [m/s]
vy0 = 0;    % Initial Y linear velocity [m/s]
wx0 = 0;    % Initial X angular velocity [rad/s]
wy0 = 0;    % Initial Y angular velocity [rad/s]
% Initial foot positions [m]
leftinit =  [0;0;-h];
rightinit = [0;0;-h];

% Calculate initial joint angles
%init_angs_L = walkerInvKin(leftinit, upper_leg_length, lower_leg_length,'3D');     
%init_angs_R = walkerInvKin(rightinit, upper_leg_length, lower_leg_length,'3D');
init_angs_L = [0 0 0 0 0];
init_angs_R = [0 0 0 0 0];

%Max and min torque for Antagonistic PAM actuators
%antagonisticPAMmaxTorque = 3;
%antagonisticPAMminTorque = -3;
%Load Fxp model in workspace
%load('F_xPModel\fxpSurface.mat');
%load('F_xPModel\gofFxpSurface.mat');
curve = @(x,P)  -0.002697-93.8*x+2.917*P+13.05*x^2-0.04264*x*P-0.001793*P^2-0.9395*x^3-0.001597*x^2*P-0.0001142*x*P^2+4.694e-06*P^3+0.03335*x^4+6.106e-06*x^3*P+2.699e-06*x^2*P^2+1.25e-07*x*P^3-5.675e-09*P^4-0.0004611*x^5+9.334e-07*x^4*P-1.221e-08*x^3*P^2-1.463e-09*x^2*P^3-4.929e-11*x*P^4+2.492e-12*P^5;
%Muscle characteristics
muscle_nominal_length = 0.26; %(m)
muscle_diameter = 0.02; %(m)
%Cte of time for Spring and Damping relationship
tau = 0.3;
% Initial conditions for muscles
%AnkleD (Right)
%Roll
x10_ankleD_roll = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_ankleD_roll = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_ankleD_roll = 1.6809; % In V
v20_ankleD_roll = 1.6807; % In V
%Pitch
x10_ankleD_pitch = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_ankleD_pitch = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_ankleD_pitch = 1.6809; % In V
v20_ankleD_pitch = 1.6807; % In V
%AnkleI (Left)
%Roll
x10_ankleI_roll = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_ankleI_roll = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_ankleI_roll = 1.6809; %In V
v20_ankleI_roll = 1.6807; % In V
%Pitch
x10_ankleI_pitch = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_ankleI_pitch = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_ankleI_pitch = 1.6809; %In V
v20_ankleI_pitch = 1.6807; % In V
%KneeD (Right)
% x10_kneeD = 0.32*muscle_nominal_length/100;
% x20_kneeD = 28.12*muscle_nominal_length/100; % In (m);
% v10_kneeD = 0;
% v20_kneeD = 7.9798;
x10_kneeD = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_kneeD = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_kneeD = 1.6809; %In V
v20_kneeD = 1.6807; % In V
%KneeI (Left)
% x10_kneeI = 0.32*muscle_nominal_length/100;
% x20_kneeI = 28.12*muscle_nominal_length/100; % In (m);
% v10_kneeI = 0;
% v20_kneeI = 7.9798;
x10_kneeI = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_kneeI = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_kneeI = 1.6809; %In V
v20_kneeI = 1.6807; % In V
%HipD (Right)
%Roll
x10_hipD_roll = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_hipD_roll = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_hipD_roll = 1.6809; %In V
v20_hipD_roll = 1.6807; %In V
%Pitch
x10_hipD_pitch = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_hipD_pitch = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_hipD_pitch = 1.6809; %In V
v20_hipD_pitch = 1.6807; %In V
%HipI (Left)
%Roll
x10_hipI_roll = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_hipI_roll = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_hipI_roll = 1.6809; %In V
v20_hipI_roll = 1.6807; %In V
%Pitch
x10_hipI_pitch = 13.0864*muscle_nominal_length/100; %14.06*muscle_nominal_length/100; % In (m)
x20_hipI_pitch = 13.0848*muscle_nominal_length/100; %14.05*muscle_nominal_length/100; % In (m)
v10_hipI_pitch = 1.6809; %In V
v20_hipI_pitch = 1.6807; %In V

%Regulator type for proportional pressure regulator (Datasheet have 3
%obtions)
regulator_type = 1;

%Angle limit for joints(left leg)
ankleI_roll_jointMAX = 7*pi/36;
ankleI_roll_jointMIN = -5*pi/36;
ankleI_pitch_jointMAX = pi/4;
ankleI_pitch_jointMIN = -pi/4;
kneeI_jointMAX = pi/2;
kneeI_jointMIN = 0;
hipI_roll_jointMAX = 0; %pi/16;
hipI_roll_jointMIN = -pi/8;
hipI_pitch_jointMAX = pi/4;
hipI_pitch_jointMIN = -pi/4;
%Angle limit for joints (right leg)
ankleD_roll_jointMAX = 5*pi/36;
ankleD_roll_jointMIN = -7*pi/36;
ankleD_pitch_jointMAX = pi/4;
ankleD_pitch_jointMIN = -pi/4;
kneeD_jointMAX = pi/2;
kneeD_jointMIN = 0;
hipD_roll_jointMAX = pi/8;
hipD_roll_jointMIN = 0; %-pi/16;
hipD_pitch_jointMAX = pi/4;
hipD_pitch_jointMIN = -pi/4;