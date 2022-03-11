%% PLOT ACTIONS
time = actions.Time;
time1 = linspace(0,10,length(time));
ankle_D1 = actions.Data(:,1);
ankle_D2 = actions.Data(:,2);
knee_D1 = actions.Data(:,3);
hip_D1 = actions.Data(:,4);
hip_D2 = actions.Data(:,5);
ankle_I1 = actions.Data(:,6);
ankle_I2 = actions.Data(:,7);
knee_I1 = actions.Data(:,8);
hip_I1 = actions.Data(:,9);
hip_I2 = actions.Data(:,10);

%% Tobillo derecho
figure
subplot(2,1,1)
plot(time1,2.2+ankle_D1,time1,2.2-ankle_D1)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos del tobillo derecho (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
subplot(2,1,2)
plot(time1,2.2+ankle_D2,time1,2.2-ankle_D2)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos del tobillo derecho (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
%% Rodilla derecha
figure
plot(time1,2.2+knee_D1,time1,2.2-knee_D1)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos de la rodilla derecha')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
%% Cadera derecha
figure
subplot(2,1,1)
plot(time1,2.2+hip_D1,time1,2.2-hip_D1)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos de la cadera derecha (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
subplot(2,1,2)
plot(time1,2.2+hip_D2,time1,2.2-hip_D2)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos de la cadera derecha (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
%% Tobillo izquierdo
figure
subplot(2,1,1)
plot(time1,2.2+ankle_I1,time1,2.2-ankle_I1)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos del tobillo izquierdo (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
subplot(2,1,2)
plot(time1,2.2+ankle_I2,time1,2.2-ankle_I2)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos del tobillo izquierdo (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
%% Rodilla izquierda
figure
plot(time1,2.2+knee_I1,time1,2.2-knee_I1)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos de la rodilla izquierda')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
%% Cadera izquierda
figure
subplot(2,1,1)
plot(time1,2.2+hip_I1,time1,2.2-hip_I1)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos de la cadera izquierda (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')
subplot(2,1,2)
plot(time1,2.2+hip_I2,time1,2.2-hip_I2)
limits = [0 max(time1) 0 5];
axis(limits)
title('Voltaje de los musculos de la cadera izquierda (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
legend('Voltaje músculo 1','Voltaje músculo 2')

%% Subplots para paper
%% Pierna derecha
% Tobillo derecho
figure
subplot(5,1,1)
plot(time1,2.2+ankle_D1,time1,2.2-ankle_D1)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos del tobillo derecho (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
subplot(5,1,2)
plot(time1,2.2+ankle_D2,time1,2.2-ankle_D2)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos del tobillo derecho (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
% Rodilla derecha
subplot(5,1,3)
plot(time1,2.2+knee_D1,time1,2.2-knee_D1)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos de la rodilla derecha')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
% Cadera derecha
subplot(5,1,4)
plot(time1,2.2+hip_D1,time1,2.2-hip_D1)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos de la cadera derecha (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
subplot(5,1,5)
plot(time1,2.2+hip_D2,time1,2.2-hip_D2)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos de la cadera derecha (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')

%% Pierna izquierda
% Tobillo izquierdo
figure
subplot(5,1,1)
plot(time1,2.2+ankle_I1,time1,2.2-ankle_I1)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos del tobillo izquierdo (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
subplot(5,1,2)
plot(time1,2.2+ankle_I2,time1,2.2-ankle_I2)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos del tobillo izquierdo (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
% Rodilla izquierda
subplot(5,1,3)
plot(time1,2.2+knee_I1,time1,2.2-knee_I1)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos de la rodilla izquierda')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
% Cadera izquierda
subplot(5,1,4)
plot(time1,2.2+hip_I1,time1,2.2-hip_I1)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos de la cadera izquierda (roll)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
subplot(5,1,5)
plot(time1,2.2+hip_I2,time1,2.2-hip_I2)
limits = [0 max(time1) 0.5 4];
axis(limits)
title('Voltaje de los musculos de la cadera izquierda (pitch)')
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')