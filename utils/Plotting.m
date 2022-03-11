%Description: Plots of simulation parameters
%% Torque
%Ankle_roll
figure
plot(simout.measR.ankle_roll_torque.Time,simout.measR.ankle_roll_torque.Data)
title('Torque(ankleD_roll)')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Ankle I_roll 
figure
plot(simout.measL.ankle_roll_torque.Time,simout.measL.ankle_roll_torque.Data)
title('Torque(ankleI_roll)')
xlabel('t(s)')
ylabel('Torque(Nm)')
%KneeD
figure
plot(simout.measR.knee_torque.Time,simout.measR.knee_torque.Data)
%KneeI
figure
plot(simout.measL.knee_torque.Time,simout.measL.knee_torque.Data)
title('Torque(kneeI)')
xlabel('t(s)')
ylabel('Torque(Nm)')
%HipD_roll
figure
plot(simout.measR.hip_roll_torque.Time,simout.measR.hip_roll_torque.Data)
%HipI_roll
figure
plot(simout.measL.hip_roll_torque.Time,simout.measL.hip_roll_torque.Data)
%% x1
%AnkleD_roll
figure
plot(x1.Time,x1.Data(:,1))
title('x1(ankleD)')
xlabel('t(s)')
ylabel('% contraction')
%KneeD
figure
plot(x1.Time,x1.Data(:,3))
%HipD_roll
figure
plot(x1.Time,x1.Data(:,4))
%AnkleI_roll
figure
plot(x1.Time,x1.Data(:,6))
title('x1(ankleI)')
xlabel('t(s)')
ylabel('% contraction')
%% x2
%AnkleD_roll
figure
plot(x2.Time,x2.Data(:,1))
title('x2(ankleD_roll)')
xlabel('t(s)')
ylabel('% contraction')
%AnkleI_roll
figure
plot(x2.Time,x2.Data(:,6))
title('x2(ankleI_roll)')
xlabel('t(s)')
ylabel('% contraction')
%% x1 and x2 together
%Ankle I_roll
figure
plot(x1.Time,x1.Data(:,6))
hold on
plot(x2.Time,x2.Data(:,6))
title('x(ankleI_roll)')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
%Knee I
figure
plot(x1.Time,x1.Data(:,8))
hold on
plot(x2.Time,x2.Data(:,8))
title('x(kneeI)')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
%% F1
%Ankle D_roll
figure
plot(F1.Time,F1.Data(:,1))
title('F1(ankleD_roll)')
xlabel('t(s)')
ylabel('F1(N)')
%Ankle I_roll
figure
plot(F1.Time,F1.Data(:,6))
title('F1(ankleI_roll)')
xlabel('t(s)')
ylabel('F1(N)')
%Knee D
figure
plot(F1.Time,F1.Data(:,3))
title('F1(kneeD)')
xlabel('t(s)')
ylabel('F1(N)')
%Knee I
figure
plot(F1.Time,F1.Data(:,8))
title('F1(kneeI)')
xlabel('t(s)')
ylabel('F1(N)')
%% F2
%Ankle D_roll
figure
plot(F2.Time,F2.Data(:,1))
title('F2(ankleD_roll)')
xlabel('t(s)')
ylabel('F2(N)')
%Ankle I_roll
figure
plot(F2.Time,F2.Data(:,6))
title('F2(ankleI_roll)')
xlabel('t(s)')
ylabel('F2(N)')
%Knee D
figure
plot(F2.Time,F2.Data(:,3))
title('F2(kneeD)')
xlabel('t(s)')
ylabel('F2(N)')
%Knee I
figure
plot(F2.Time,F2.Data(:,8))
title('F2(kneeI)')
xlabel('t(s)')
ylabel('F2(N)')
%% F1 and F2 same plot
%Ankle I_roll
figure
plot(F1.Time,F1.Data(:,6))
hold on
plot(F2.Time,F2.Data(:,6))
title('F(ankleI_roll)')
xlabel('t(s)')
ylabel('F(N)')
legend('F1','F2')
%Knee I
figure
plot(F1.Time,F1.Data(:,8))
hold on
plot(F2.Time,F2.Data(:,8))
title('F(kneeI)')
xlabel('t(s)')
ylabel('F(N)')
legend('F1','F2')
%% Angles
%Ankle D roll
figure
plot(simout.measR.ankle_roll_angle.Time,simout.measR.ankle_roll_angle.Data)
%Ankle I roll
figure
plot(simout.measL.ankle_roll_angle.Time,simout.measL.ankle_roll_angle.Data)
title('Roll angle(ankleI)')
xlabel('t(s)')
ylabel('angle(rad)')
%Ankle D pitch
figure
plot(simout.measR.ankle_pitch_angle.Time,simout.measR.ankle_pitch_angle.Data)
%Ankle I pitch
figure
plot(simout.measL.ankle_pitch_angle.Time,simout.measL.ankle_pitch_angle.Data)
title('Pitch angle(ankleI)')
xlabel('t(s)')
ylabel('angle(rad)')

%KneeD
figure
plot(simout.measR.knee_angle.Time,simout.measR.knee_angle.Data)
%KneeI
figure
plot(simout.measL.knee_angle.Time,simout.measL.knee_angle.Data)
title('Angle of the left knee joint')
xlabel('t(s)')
ylabel('angle(rad)')
%% Pressure
%Ankle1 D_roll
figure
plot(P1.Time,P1.Data(:,1))
%Ankle1 I_roll
figure
plot(P1.Time,P1.Data(:,6))
hold on
plot(P2.Time,P2.Data(:,6))
title('Pressures(ankleI_roll)')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')
% Knee I
figure
plot(P1.Time,P1.Data(:,8),'LineWidth',2)
hold on
plot(P2.Time,P2.Data(:,8),'LineWidth',2)
title('Left Knee pressures')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')

%% Subplots for report
%% AnkleI roll
figure
%Pressures
subplot(2,2,1)
plot(P1.Time,P1.Data(:,6),'LineWidth',2)
hold on
plot(P2.Time,P2.Data(:,6),'LineWidth',2)
title('Left roll-ankle muscles pressures')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')
%Torque
subplot(2,2,2)
plot(simout.measL.ankle_roll_torque.Time,simout.measL.ankle_roll_torque.Data,'LineWidth',2)
title('Left roll-ankle joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Contraction
subplot(2,2,3)
plot(x1.Time,x1.Data(:,6),'LineWidth',2)
hold on
plot(x2.Time,x2.Data(:,6),'LineWidth',2)
title('Left roll-ankle muscles contraction')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
%Angle
subplot(2,2,4)
plot(simout.measL.ankle_roll_angle.Time,simout.measL.ankle_roll_angle.Data,'LineWidth',2)
title('Left roll-ankle joint angle')
xlabel('t(s)')
ylabel('angle(rad)')
%% AnkleI pitch 
figure
%Pressures
subplot(2,2,1)
plot(P1.Time,P1.Data(:,7),'LineWidth',2)
hold on
plot(P2.Time,P2.Data(:,7),'LineWidth',2)
title('Left pitch-ankle muscles pressures')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')
%Torque
subplot(2,2,2)
plot(simout.measL.ankle_pitch_torque.Time,simout.measL.ankle_pitch_torque.Data,'LineWidth',2)
title('Left pitch-ankle joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Contraction
subplot(2,2,3)
plot(x1.Time,x1.Data(:,7),'LineWidth',2)
hold on
plot(x2.Time,x2.Data(:,7),'LineWidth',2)
title('Left pitch-ankle muscles contraction')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
%Angle
subplot(2,2,4)
plot(simout.measL.ankle_pitch_angle.Time,simout.measL.ankle_pitch_angle.Data,'LineWidth',2)
title('Left pitch-ankle joint angle')
xlabel('t(s)')
ylabel('angle(rad)')
%% Knee I
figure
% %Pressures
% subplot(2,2,1)
% plot(P1.Time,P1.Data(:,8),'LineWidth',2)
% hold on
% plot(P2.Time,P2.Data(:,8),'LineWidth',2)
% title('Left knee muscles pressures')
% xlabel('t(s)')
% ylabel('pressure(bar)')
% legend('P1','P2')
% %Contraction
% subplot(2,2,3)
% plot(x1.Time,x1.Data(:,8),'LineWidth',2)
% hold on
% plot(x2.Time,x2.Data(:,8),'LineWidth',2)
% title('Left knee muscles contraction')
% xlabel('t(s)')
% ylabel('% contraction')
% legend('x1','x2')
% ylim([0 30])
%Torque
subplot(2,2,2)
plot(simout.measL.knee_torque.Time,simout.measL.knee_torque.Data,'LineWidth',2)
title('Left knee joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Angle
subplot(2,2,4)
plot(simout.measL.knee_angle.Time,simout.measL.knee_angle.Data,'LineWidth',2)
title('Left knee joint angle')
xlabel('t(s)')
ylabel('angle(rad)')
%% Hip I pitch
figure
% %Pressures
% subplot(2,2,1)
% plot(P1.Time,P1.Data(:,10),'LineWidth',2)
% hold on
% plot(P2.Time,P2.Data(:,10),'LineWidth',2)
% title('Left pitch-hip muscles pressures')
% xlabel('t(s)')
% ylabel('pressure(bar)')
% legend('P1','P2')
% %Contraction
% subplot(2,2,3)
% plot(x1.Time,x1.Data(:,10),'LineWidth',2)
% hold on
% plot(x2.Time,x2.Data(:,10),'LineWidth',2)
% title('Left pitch-hip muscles contraction')
% xlabel('t(s)')
% ylabel('% contraction')
% legend('x1','x2')
% ylim([0 30])
%Torque
subplot(2,2,2)
plot(simout.measL.hip_pitch_torque.Time,simout.measL.hip_pitch_torque.Data,'LineWidth',2)
title('Left pitch-hip joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Angle
subplot(2,2,4)
plot(simout.measL.hip_pitch_angle.Time,simout.measL.hip_pitch_angle.Data,'LineWidth',2)
title('Left pitch-hip joint angle')
xlabel('t(s)')
ylabel('angle(rad)')
%% Hip I roll
figure
%Pressures
subplot(2,2,1)
plot(P1.Time,P1.Data(:,9),'LineWidth',2)
hold on
plot(P2.Time,P2.Data(:,9),'LineWidth',2)
title('Left roll-hip muscles pressures')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')
%Contraction
subplot(2,2,3)
plot(x1.Time,x1.Data(:,9),'LineWidth',2)
hold on
plot(x2.Time,x2.Data(:,9),'LineWidth',2)
title('Left roll-hip muscles contraction')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
ylim([0 30])
%Torque
subplot(2,2,2)
plot(simout.measL.hip_roll_torque.Time,simout.measL.hip_roll_torque.Data,'LineWidth',2)
title('Left roll-hip joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Angle
subplot(2,2,4)
plot(simout.measL.hip_roll_angle.Time,simout.measL.hip_roll_angle.Data,'LineWidth',2)
title('Left roll-hip joint angle')
xlabel('t(s)')
ylabel('angle(rad)')

%%
%Right leg
%% AnkleD roll
figure
% %Pressures
% subplot(2,2,1)
% plot(P1.Time,P1.Data(:,1),'LineWidth',2)
% hold on
% plot(P2.Time,P2.Data(:,1),'LineWidth',2)
% title('Right roll-ankle muscles pressures')
% xlabel('t(s)')
% ylabel('pressure(bar)')
% legend('P1','P2')
%Torque
subplot(2,2,2)
plot(simout.measR.ankle_roll_torque.Time,simout.measR.ankle_roll_torque.Data,'LineWidth',2)
title('Right roll-ankle joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
% %Contraction
% subplot(2,2,3)
% plot(x1.Time,x1.Data(:,1),'LineWidth',2)
% hold on
% plot(x2.Time,x2.Data(:,1),'LineWidth',2)
% title('Right roll-ankle muscles contraction')
% xlabel('t(s)')
% ylabel('% contraction')
% legend('x1','x2')
%Angle
subplot(2,2,4)
plot(simout.measR.ankle_roll_angle.Time,simout.measR.ankle_roll_angle.Data,'LineWidth',2)
title('Right roll-ankle joint angle')
xlabel('t(s)')
ylabel('angle(rad)')

%% AnkleD pitch
figure
%Pressures
subplot(2,2,1)
plot(P1.Time,P1.Data(:,2),'LineWidth',2)
hold on
plot(P2.Time,P2.Data(:,2),'LineWidth',2)
title('Right pitch-ankle muscles pressures')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')
%Torque
subplot(2,2,2)
plot(simout.measR.ankle_pitch_torque.Time,simout.measR.ankle_pitch_torque.Data,'LineWidth',2)
title('Right pitch-ankle joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Contraction
subplot(2,2,3)
plot(x1.Time,x1.Data(:,2),'LineWidth',2)
hold on
plot(x2.Time,x2.Data(:,2),'LineWidth',2)
title('Right pitch-ankle muscles contraction')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
%Angle
subplot(2,2,4)
plot(simout.measR.ankle_pitch_angle.Time,simout.measR.ankle_pitch_angle.Data,'LineWidth',2)
title('Right pitch-ankle joint angle')
xlabel('t(s)')
ylabel('angle(rad)')
%% KneeD
figure
% %Pressures
% subplot(2,2,1)
% plot(P1.Time,P1.Data(:,3),'LineWidth',2)
% hold on
% plot(P2.Time,P2.Data(:,3),'LineWidth',2)
% title('Right knee muscles pressures')
% xlabel('t(s)')
% ylabel('pressure(bar)')
% legend('P1','P2')
% %Contraction
% subplot(2,2,3)
% plot(x1.Time,x1.Data(:,3),'LineWidth',2)
% hold on
% plot(x2.Time,x2.Data(:,3),'LineWidth',2)
% title('Right knee muscles contraction')
% xlabel('t(s)')
% ylabel('% contraction')
% legend('x1','x2')
% ylim([0 30])
%Torque
subplot(2,2,2)
plot(simout.measR.knee_torque.Time,simout.measR.knee_torque.Data,'LineWidth',2)
title('Right knee joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Angle
subplot(2,2,4)
plot(simout.measR.knee_angle.Time,simout.measR.knee_angle.Data,'LineWidth',2)
title('Right knee joint angle')
xlabel('t(s)')
ylabel('angle(rad)')

%% HipD roll
figure
%Pressures
subplot(2,2,1)
plot(P1.Time,P1.Data(:,4),'LineWidth',2)
hold on
plot(P2.Time,P2.Data(:,4),'LineWidth',2)
title('Right roll-hip muscles pressures')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')
%Contraction
subplot(2,2,3)
plot(x1.Time,x1.Data(:,4),'LineWidth',2)
hold on
plot(x2.Time,x2.Data(:,4),'LineWidth',2)
title('Right roll-hip muscles contraction')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
ylim([0 30])
%Torque
subplot(2,2,2)
plot(simout.measR.hip_roll_torque.Time,simout.measR.hip_roll_torque.Data,'LineWidth',2)
title('Right roll-hip joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Angle
subplot(2,2,4)
plot(simout.measR.hip_roll_angle.Time,simout.measR.hip_roll_angle.Data,'LineWidth',2)
title('Right roll-hip joint angle')
xlabel('t(s)')
ylabel('angle(rad)')
% HipD pitch
figure
%Pressures
subplot(2,2,1)
plot(P1.Time,P1.Data(:,5),'LineWidth',2)
hold on
plot(P2.Time,P2.Data(:,5),'LineWidth',2)
title('Right pitch-hip muscles pressures')
xlabel('t(s)')
ylabel('pressure(bar)')
legend('P1','P2')
%Contraction
subplot(2,2,3)
plot(x1.Time,x1.Data(:,5),'LineWidth',2)
hold on
plot(x2.Time,x2.Data(:,5),'LineWidth',2)
title('Right pitch-hip muscles contraction')
xlabel('t(s)')
ylabel('% contraction')
legend('x1','x2')
ylim([0 30])
Torque
subplot(2,2,2)
plot(simout.measR.hip_pitch_torque.Time,simout.measR.hip_pitch_torque.Data,'LineWidth',2)
title('Right pitch-hip joint torque')
xlabel('t(s)')
ylabel('Torque(Nm)')
%Angle
subplot(2,2,4)
plot(simout.measR.hip_pitch_angle.Time,simout.measR.hip_pitch_angle.Data,'LineWidth',2)
title('Right pitch-hip joint angle')
xlabel('t(s)')
ylabel('angle(rad)')