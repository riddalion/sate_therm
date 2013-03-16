function F=main_mod(x)
if ischar(x)
    clear x
    syms s1t s2t s3t s4t s5t s6t %kick start the program
else
s1t = x(1);
s2t = x(2);
s3t = x(3);
s4t = x(4);
s5t = x(5);
s6t = x(6);
end
%THIS IS THE COMPUTATION CORE OF THE PROGRAM
%BEGIN COMPUTATIONS NOW
load('f_run_var.mat'); %loads all variables
%rtime.mat must be created inside the for loop which maintains iterations.
load('rtime.mat'); %rtime: real time:: day, orbital pos, temperatures!!THIS WILL REWRITE SOME OLD DATA FROM F_RUN_VAR
c1 = temp_mat(1,cntr);
c2 = temp_mat(2,cntr);
c3 = temp_mat(3,cntr);
c4 = temp_mat(4,cntr);
c5 = temp_mat(5,cntr);
c6 = temp_mat(6,cntr);
%load computers!

%solar loads & others

%90 addition coz of phase btn the plates
q_1_in_tot = a1*s1a1*tot_l(sat_pos_orbit,sat_pos_axis+90+90+90,b,y1,alb_f,erad,Be);
q_3_in_tot = a3*s1a3*tot_l(sat_pos_orbit,sat_pos_axis,b,y1,alb_f,erad,Be);
q_5_in_tot = a5*s1a5*tot_l(sat_pos_orbit,sat_pos_axis+90+90,b,y1,alb_f,erad,Be);
q_6_in_tot = a6*s1a6*tot_l(sat_pos_orbit,sat_pos_axis+90,b,y1,alb_f,erad,Be);
%because 2 and 4 are the axis, they need special treatment

if sat_pos_orbit >= 0 && sat_pos_orbit <= 90
    s =  (1367e-6)*(1.00011+0.034221*cosd(2*b))*((y1-100)/90*sat_pos_orbit+100);
elseif sat_pos_orbit > 90 && sat_pos_orbit <= 90+sangle
    s =  (1367e-6)*(1.00011+0.034221*cosd(2*b))* y1/100;
elseif sat_pos_orbit > 90+sangle && sat_pos_orbit <= 270-sangle
    s = 0;
elseif sat_pos_orbit >270-sangle && sat_pos_orbit <= 270
    s =  (1367e-6)*(1.00011+0.034221*cosd(2*b))* y1/100;
elseif sat_pos_orbit > 270 && sat_pos_orbit <= 360
    s =  (1367e-6)*(1.00011+0.034221*cosd(2*b))*(-(y1-100)/90*(sat_pos_orbit-180)+100);
end
s = s*cosd(Be); %solar load has been taken care in all zones
solr_axs = sind(Be)*s;
%************* from tot_l
%albedo direct load
alb_dir = alb_f*s*cosd(sat_pos_axis);
if sat_pos_axis >0 && sat_pos_axis <90 || sat_pos_axis >270 && sat_pos_axis < 360
    alb_dir = 0;
end
%albedo diffuse load
alb_diff = (30/100)*(alb_f*s)*sind(sat_pos_axis);
%earth direct load
earth_dir = erad*cosd(sat_pos_axis);
if sat_pos_axis >0 && sat_pos_axis <90 || sat_pos_axis >270 && sat_pos_axis < 360
    earth_dir = 0;
end
%earth diffuse load
earth_diff = (30/100)*erad*sind(sat_pos_axis);
%*************
tot_axs = solr_axs+alb_diff+alb_dir+earth_diff+earth_dir; %just multiply this thing for all plates
q_2_in_tot = a2*s1a2*tot_axs;
tot_axs = solr_axs+alb_diff+alb_dir+earth_diff+earth_dir; %just multiply this thing for all plates
q_4_in_tot = a4*s1a4*tot_axs;
%this IF will reset the value according to position of orbit
if Be >= 0 && Be < 90 || Be >180 && Be < 270
    solr_axs = 0;
    tot_axs = solr_axs+alb_diff+alb_dir+earth_diff+earth_dir; %just multiply this thing for all plates
    q_2_in_tot = a2*s1a2*tot_axs;
else
    solr_axs = 0;
    tot_axs = solr_axs+alb_diff+alb_dir+earth_diff+earth_dir; %just multiply this thing for all plates
    q_4_in_tot = a4*s1a4*tot_axs;
end
q_1_out_rad = s1e1*stf_blt*a1*((s1t-m1*cp1*(s1t-c1))^4 - (amb).^4);
%special nomenclature one plate to any other plates by conduction or radiation
%then q_1to2_c = heat 1 to 2 by conduction replace c by r for radiation
q_1to2_c = (s1t-s2t)/(cr_p1top2*b2*t2);
q_1to3_c = (s1t-s3t)/(cr_p1top3*b3*t3);
q_1to4_c = (s1t-s4t)/(cr_p1top4*b4*t4);
q_1to5_c = (s1t-s5t)/(cr_p1top5*b5*t5);
q_1toall_c= q_1to2_c+q_1to3_c+q_1to4_c+q_1to5_c;
%radiation loads from plate 1 to other plates interior surfaces
%s2t1 = s1t + m*cp*(s1t-c1)*l/(2*k*a1);
q_1to2_r = vf12*stf_blt*s2e1*((s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4-(s2t + m2*cp6*(s2t-c2)*t2/(2*k2*a2))^4);
q_1to3_r = vf13*stf_blt*s2e1*((s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4-(s3t + m3*cp6*(s3t-c3)*t3/(2*k3*a3))^4);
q_1to4_r = vf14*stf_blt*s2e1*((s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4-(s4t + m4*cp6*(s4t-c4)*t4/(2*k4*a4))^4);
q_1to5_r = vf15*stf_blt*s2e1*((s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4-(s5t + m5*cp6*(s5t-c5)*t5/(2*k5*a5))^4);
q_1to6_r = vf15*stf_blt*s2e1*((s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4-(s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4);
q_1toall_r=q_1to6_r+q_1to2_r+q_1to3_r+q_1to4_r+q_1to5_r;

% q_net_1= q_1_in_tot-q_1_out_rad-q_1toall_c-q_1toall_r;

%heat transfer from plate 2 to other plates:
%fprintf('\nEquation formed for plate 1...');
%fprintf('\nBuilding equation for plate 2...');
%heat transfer by conduction

q_2_out_rad = s1e2*stf_blt*a2*((s2t-m2*cp2*(s2t-c2))^4 - (amb).^4);
%special nomenclature one plate to any other plates by conduction or radiation
%then q_2to2_c = heat 2 to 2 by conduction replace c by r for radiation
q_2to1_c = (s2t-s1t)/(cr_p1top2*b2*t2);
q_2to3_c = (s2t-s3t)/(cr_p2top3*l2*t2);
q_2to5_c = (s2t-s5t)/(cr_p2top3*l5*t5);
q_2to6_c = (s2t-s6t)/(cr_p6top2*b6*t6);
q_2toall_c= q_2to1_c+q_2to3_c+q_2to5_c+q_2to6_c;
%radiation loads from plate 2 to other plates interior surfaces
q_2to1_r = f21*stf_blt*s2e2*((s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4-(s2t + m2*cp1*(s1t-c1)*t1/(2*k1*a1))^4);
q_2to3_r = f23*stf_blt*s2e2*((s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4-(s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4);
q_2to4_r = f24*stf_blt*s2e2*((s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4-(s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4);
q_2to5_r = f25*stf_blt*s2e2*((s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4-(s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4);
q_2to6_r = f25*stf_blt*s2e2*((s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4-(s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4);
q_2toall_r=q_2to6_r+q_2to1_r+q_2to3_r+q_2to4_r+q_2to5_r;

% q_net_2= q_2_in_tot-q_2_out_rad-q_2toall_c-q_2toall_r;

%fprintf('\nEquation formed for plate 2...');
%fprintf('\nBuilding equation for plate 3...');

q_3_out_rad = s1e3*stf_blt*a3*((s3t-m3*cp3*(s3t-c3))^4 - (amb).^4);
%special nomenclature one plate to any other plates by conduction or radiation
%then q_3to2_c = heat 3 to 2 by conduction replace c by r for radiation
q_3to2_c = (s3t-s2t)/(cr_p2top3*l2*t2);
q_3to1_c = (s3t-s3t)/(cr_p1top3*b3*t3);
q_3to4_c = (s3t-s4t)/(cr_p3top4*l4*t4);
q_3to6_c = (s3t-s5t)/(cr_p6top3*b3*t3);
q_3toall_c= q_3to2_c+q_3to1_c+q_3to4_c+q_3to6_c;
%radiation loads from plate 3 to other plates interior surfaces
%s2t3 = s3t + m*cp*(s3t-c3)*l/(2*k*a3);
q_3to2_r = f32*stf_blt*s2e3*((s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4-(s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4);
q_3to1_r = f31*stf_blt*s2e3*((s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4-(s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4);
q_3to4_r = f34*stf_blt*s2e3*((s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4-(s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4);
q_3to5_r = f35*stf_blt*s2e3*((s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4-(s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4);
q_3to6_r = f35*stf_blt*s2e3*((s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4-(s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4);
q_3toall_r=q_3to6_r+q_3to2_r+q_3to1_r+q_3to4_r+q_3to5_r;
% q_net_3= q_3_in_tot-q_3_out_rad-q_3toall_c-q_3toall_r;

%fprintf('\nEquation formed for plate 3...');
%fprintf('\nBuilding equation for plate 4...');

q_4_out_rad = s1e4*stf_blt*a4*((s4t-m4*cp4*(s4t-c4))^4 - (amb).^4);
%special nomenclature one plate to any other plates by conduction or radiation
%then q_4to2_c = heat 4 to 2 by conduction replace c by r for radiation
q_4to1_c = (s4t-s2t)/(cr_p1top4*b4*t4);
q_4to3_c = (s4t-s3t)/(cr_p3top4*l4*t4);
q_4to6_c = (s4t-s4t)/(cr_p6top4*b4*t4);
q_4to5_c = (s4t-s5t)/(cr_p4top5*l4*t4);
q_4toall_c= q_4to1_c+q_4to3_c+q_4to6_c+q_4to5_c;
%radiation loads from plate 4 to other plates interior surfaces

q_4to2_r = f42*stf_blt*s2e4*((s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4-(s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4);
q_4to3_r = f43*stf_blt*s2e4*((s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4-(s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4);
q_4to1_r = f41*stf_blt*s2e4*((s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4-(s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4);
q_4to5_r = f45*stf_blt*s2e4*((s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4-(s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4);
q_4to6_r = f45*stf_blt*s2e4*((s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4-(s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4);
q_4toall_r=q_4to6_r+q_4to2_r+q_4to3_r+q_4to1_r+q_4to5_r;

% q_net_4= q_4_in_tot-q_4_out_rad-q_4toall_c-q_4toall_r;

%fprintf('\nEquation formed for plate 4...');
%fprintf('\nBuilding equation for plate 5...');

q_5_out_rad = s1e5*stf_blt*a5*((s5t-m5*cp5*(s5t-c5))^4 - (amb).^4);
%special nomenclature one plate to any other plates by conduction or radiation
%then q_5to2_c = heat 5 to 2 by conduction replace c by r for radiation
q_5to2_c = (s5t-s2t)/(cr_p2top5*b2*t2);
q_5to1_c = (s5t-s3t)/(cr_p1top5*b5*t5);
q_5to4_c = (s5t-s4t)/(cr_p4top5*l4*t4);
q_5to6_c = (s5t-s5t)/(cr_p6top5*b5*t5);
q_5toall_c= q_5to2_c+q_5to1_c+q_5to4_c+q_5to6_c;
%radiation loads from plate 5 to other plates interior surfaces

q_5to2_r = f52*stf_blt*s2e5*((s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4-(s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4);
q_5to3_r = f53*stf_blt*s2e5*((s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4-(s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4);
q_5to4_r = f54*stf_blt*s2e5*((s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4-(s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4);
q_5to1_r = f55*stf_blt*s2e5*((s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4-(s1t + m1*cp6*(s5t-c5)*t5/(2*k1*a1))^4);
q_5to6_r = f55*stf_blt*s2e5*((s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4-(s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4);
q_5toall_r=q_5to6_r+q_5to2_r+q_5to3_r+q_5to4_r+q_5to1_r;

% q_net_5= q_5_in_tot-q_5_out_rad-q_5toall_c-q_5toall_r;
%fprintf('\nEquation formed for plate 5...');
%fprintf('\nBuilding equation for plate 6...');


q_6_out_rad = s1e6*stf_blt*a6*((s6t-m6*cp6*(s6t-c6))^4 - (amb).^4);
%special nomenclature one plate to any other plates by conduction or radiation
%then q_6to2_c = heat 6 to 2 by conduction replace c by r for radiation
q_6to2_c = (s6t-s2t)/(cr_p6top2*b2*t2);
q_6to3_c = (s6t-s3t)/(cr_p6top3*b3*t3);
q_6to4_c = (s6t-s4t)/(cr_p6top4*b4*t4);
q_6to5_c = (s6t-s5t)/(cr_p6top5*b5*t5);
q_6toall_c= q_6to2_c+q_6to3_c+q_6to4_c+q_6to5_c;
%radiation loads from plate 6 to other plates interior surfaces
%s2t6 = s6t + m*cp*(s6t-c6)*l/(2*k*a6);
q_6to2_r = f62*stf_blt*s2e6*((s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4-(s2t + m2*cp2*(s2t-c2)*t2/(2*k2*a2))^4);
q_6to3_r = f63*stf_blt*s2e6*((s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4-(s3t + m3*cp3*(s3t-c3)*t3/(2*k3*a3))^4);
q_6to4_r = f64*stf_blt*s2e6*((s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4-(s4t + m4*cp4*(s4t-c4)*t4/(2*k4*a4))^4);
q_6to5_r = f65*stf_blt*s2e6*((s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4-(s5t + m5*cp5*(s5t-c5)*t5/(2*k5*a5))^4);
q_6to1_r = f61*stf_blt*s2e6*((s6t + m6*cp6*(s6t-c6)*t6/(2*k6*a6))^4-(s1t + m1*cp1*(s1t-c1)*t1/(2*k1*a1))^4);
q_6toall_r=q_6to1_r+q_6to2_r+q_6to3_r+q_6to4_r+q_6to5_r;
% q_net_6= q_6_in_tot-q_6_out_rad-q_6toall_c-q_6toall_r;
F = [q_1_in_tot-q_1_out_rad-q_1toall_c-q_1toall_r;...
     q_2_in_tot-q_2_out_rad-q_2toall_c-q_2toall_r;...
     q_3_in_tot-q_3_out_rad-q_3toall_c-q_3toall_r;...
     q_4_in_tot-q_4_out_rad-q_4toall_c-q_4toall_r;...
     q_5_in_tot-q_5_out_rad-q_5toall_c-q_5toall_r;...
     q_6_in_tot-q_6_out_rad-q_6toall_c-q_6toall_r];