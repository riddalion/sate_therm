%THIS IS THE LAUNCHER FOR THE SATELLITE PROGRAM
%variables acceptor (manual/auto)
clc; label; clear all;warning('off','all');
% msgbox('PLEASE READ THE TITLE OF THE INPUT DIALOGUE BOXES YOU WIL BE SHOWN BEFORE ENTERING VALUES! (resize the window, if req)');
pause(2);
var_loader();
close('all');
 clc; label;
% fprintf('\n System Paused: Hit any Key to Continue:: ');
% pause;
load('f_run_var.mat');
%computing part
options = optimset('Display','off','MaxFunEvals',100000);
%ini certain variables n counter
cntr =1; t1 = s1t1; t2 = s1t2; t3 = s1t3; t4 = s1t4; t5 = s1t5; t6 = s1t6;
tot_steps = t_req/utime;temp_mat = zeros();
x = 'something';
for loop_run = utime:utime:t_req     
%     clc;
%      clc; label;
    fprintf('\n Step number : %d / %d ',cntr,tot_steps);    
    %determine satellite pos around earth
    sat_pos_orbit = sat_pos_orbit + sat_pos_orbit_u;
    % increment by step and determine plate orientations
    sat_pos_axis = sat_pos_axis + sat_pos_axis_u;
    if sat_pos_axis >= 360 %convert to angle b/w 0 to 360
        sat_pos_axis = rem(sat_pos_axis,360);
    end
    %defining a new angle zenith; abbr: zen
    %takes care of orientation change along orbit
    if sat_pos_orbit >= 0 && sat_pos_orbit <= 90
        zen = sat_pos_orbit;
    else
        zen = rem(sat_pos_orbit,90);
    end
    %%% EQUATION FORMING PART
    main_mod(x);
%     options = optimset(options,'diagnostics','off','display','off');
    fprintf('\n Please wait.. Solving equations...');
%     options = optimset('Display','iter');
    [x]= fsolve(@main_mod,x0,options);    
    temp_mat(1,cntr) = x(1); temp_mat(2,cntr) = x(2); temp_mat(3,cntr)=x(3); temp_mat(4,cntr)=x(4); temp_mat(5,cntr) = x(5); temp_mat(6,cntr)=x(6);
    rtym = 'rtime.mat';
    save(rtym,'temp_mat','sat_pos_orbit','sat_pos_axis','cntr')
    cntr = cntr+1;time_elapsed = time_elapsed+utime;
%      clc; label;
end
%plot and exit
hold on
figure(1)
col_tm = size(temp_mat);
timat = linspace(0,time_elapsed,col_tm(2));
plot(timat,temp_mat(1,:),'r');plot(timat,temp_mat(2,:),'g');
plot(timat,temp_mat(3,:),'c');plot(timat,temp_mat(4,:),'b');
plot(timat,temp_mat(5,:),'k');plot(timat,temp_mat(6,:),'m');
title('Temperature of Plates with Time');
xlabel('Time');
ylabel('Plate Temperatures');
legend('Plate 1','Plate 2','Plate 3','Plate 4','Plate 5','Plate 6',2);
set(gcf,'toolbar','none','menubar','none');
figure(2)
imshow('thank_you_for_your_time.png');