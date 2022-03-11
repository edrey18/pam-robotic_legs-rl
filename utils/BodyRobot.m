%% Robot mechanical Parameters (m)
%%Robot dimension parameters. Using Winters pag 96 of pdf
H = 1.80; % Height of the robot in metres
density = 1240; %Density of PLA in kg/m3
%density = density/8;
foot_density = 1240; %Not used but to avoid dependance errors
%Foot
foot_full_length = 0.152*H;
%Ankle part
foot_y = 0.055*H;
foot_x = 0.152*H;
foot_z = 0.039*H;
%Toe part
%Leg
lower_leg_length = 0.285*H - foot_z;
upper_leg_length = 0.530*H - lower_leg_length - foot_z;
lower_leg_y = 0.0444*H; %*(8cm for 1.8m height) 
lower_leg_x = 0.0444*H; %*(8cm for 1.8m height) 
upper_leg_y = 0.0666*H; %*(12 cm for 1.8m height)
upper_leg_x = 0.0833*H; %*(15 cm for 1.8m height)
%Torso
torso_length = 0.174*H; %x
torso_width = 0.145*H; %y.
torso_height = 0.720*H - upper_leg_length - lower_leg_length - foot_z ; %z

%Offsets
foot_offset = [-foot_full_length/2+lower_leg_x 0 0];
torso_offset_z = 0;
torso_offset_x = 0; 

%% Center of Mass and Inertia for solids
%Mass
M = 80; %mass of the full body in Kg
%The two full legs will take 32.2% of M (For 80kg full robot, legs weight
%will be 25.76kg)
%Torso weight depend on its dimension and density of material (For 1.8m and
%80 kg robot it weights 34.666kg which is 43% of total weight
foot_mass = 0.0145*M; % Factor is provided by winters table 4.1 (pag86)
lower_leg_mass = 0.0465*M;
upper_leg_mass = 0.1*M;
torso_mass = (torso_width*torso_length*torso_height)*density;
torso_mass = torso_mass/6;
%Center of Mass (CoM) position
foot_com = [0 -foot_z/2 0];  
lower_leg_com = [0 0 0.567*lower_leg_length-lower_leg_length/2];
upper_leg_com = [0 0 0.567*upper_leg_length-upper_leg_length/2];
% Radius of giration of CoM ( factor given by Table 4.1 (pag86) Winters
foot_ro = sqrt((foot_z/2)^2 + foot_offset(1)^2);
lower_leg_ro = 0.302*lower_leg_length;
upper_leg_ro = 0.323*upper_leg_length;
% Moments of Inertia
foot_I0 = foot_mass*foot_ro^2;
lower_leg_I0 = lower_leg_mass*lower_leg_ro^2;
upper_leg_I0 = upper_leg_mass*upper_leg_ro^2;
%This are the inertia moments in CoM caused by a displaced centre of
%rotation (the joints are not in the CoM)
%CHECK BECAUSE NOT SURE IF ITS OKEY
foot_I = [foot_I0 foot_I0 foot_I0+foot_mass*(foot_z/2)^2];
lower_leg_I = [lower_leg_I0 lower_leg_I0 lower_leg_I0+lower_leg_mass*(0.433*lower_leg_length)^2];
upper_leg_I = [upper_leg_I0 upper_leg_I0 upper_leg_I0+upper_leg_mass*(0.433*upper_leg_length)^2];
% Products of Inertia
foot_Ixyz = [];
lower_leg_Ixyz = [];
upper_leg_Ixyz = [];

%% Contact/friction parameters
contact_stiffness = g*(2*foot_mass + 2*lower_leg_mass + 2*upper_leg_mass + torso_mass)/0.005; %Depends weight of robot and desired overlap between ground and foot [N/m]
% coeficient is weight/displacement (N/m)
contact_damping = contact_stiffness/10;  % One value that works well is contac_stiffness/10
mu_k = 0.6; %0.6
mu_s = 0.5; %0.5
mu_vth = 0.1;