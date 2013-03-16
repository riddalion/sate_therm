%var_loader: LOADS VARIABLES INTO THE WORKSPACE
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
fprintf('\nLoad satellite parameters...Launch relevant input dialogues');
set(gcf,'toolbar','none','menubar','none');
imshow('sate_image.jpg');
%PLATE 1
plate1_prompt ={'LENGTH(mm)::','BREADTH(mm)','THICKNESS(mm)',...
    'ABSORPTIVITY(internal)','EMISSIVITY(internal)','ABSORPTIVITY(external)','EMISSIVITY(external)'...
    'DENSITY(kg/m3)','SPECIFIIC HEAT (Cp)(kJ/kg K)','THERMAL CONDUCTIVITY(W/mK)','INITIAL TEMP(K)'};
dlg_title = '::PLATE 1::';
num_lines = 1;
%aluminium surface property is given 0.8 because of prescence of solar cell
%internal surf prop due to normally black coating on the inside
def_ans = {'100','100','6','0.8','0.8','0.8','0.8','2700','0.91','167','285'};
ans1 = str2num(char(inputdlg(plate1_prompt,dlg_title,num_lines,def_ans,options)));
fprintf('\nPlate 1 done..');
%PLATE 2
plate2_prompt ={'LENGTH(mm)::','BREADTH(mm)','THICKNESS(mm)',...
    'ABSORPTIVITY(internal)','EMISSIVITY(internal)','ABSORPTIVITY(external)','EMISSIVITY(external)'...
    'DENSITY(kg/m3)','SPECIFIIC HEAT (Cp)(kJ/kg K)','THERMAL CONDUCTIVITY(W/mK)','INITIAL TEMP(K)'};
dlg_title = '::PLATE 2::';
num_lines = 1;
%aluminium surface property is given 0.8 because of prescence of solar cell
%internal surf prop due to normally black coating on the inside
def_ans = {'200','100','5','0.8','0.8','0.8','0.8','2700','0.91','167','285'};
ans2 = str2num(char(inputdlg(plate2_prompt,dlg_title,num_lines,def_ans,options)));
fprintf('\nPlate 2 done..');
%PLATE 3
plate3_prompt ={'LENGTH(mm)::','BREADTH(mm)','THICKNESS(mm)',...
    'ABSORPTIVITY(internal)','EMISSIVITY(internal)','ABSORPTIVITY(external)','EMISSIVITY(external)'...
    'DENSITY(kg/m3)','SPECIFIIC HEAT (Cp)(kJ/kg K)','THERMAL CONDUCTIVITY(W/mK)','INITIAL TEMP(K)'};
dlg_title = '::PLATE 3::';
num_lines = 1;
%aluminium surface property is given 0.8 because of prescence of solar cell
%internal surf prop due to normally black coating on the inside
def_ans = {'200','100','5','0.8','0.8','0.8','0.8','2700','0.91','167','285'};
ans3 = str2num(char(inputdlg(plate3_prompt,dlg_title,num_lines,def_ans,options)));
fprintf('\nPlate 3 done..');
%PLATE 4
plate4_prompt ={'LENGTH(mm)::','BREADTH(mm)','THICKNESS(mm)',...
    'ABSORPTIVITY(internal)','EMISSIVITY(internal)','ABSORPTIVITY(external)','EMISSIVITY(external)'...
    'DENSITY(kg/m3)','SPECIFIIC HEAT (Cp)(kJ/kg K)','THERMAL CONDUCTIVITY(W/mK)','INITIAL TEMP(K)'};
dlg_title = '::PLATE 4::';
num_lines = 1;
%aluminium surface property is given 0.8 because of prescence of solar cell
%internal surf prop due to normally black coating on the inside
def_ans = {'200','100','5','0.8','0.8','0.8','0.8','2700','0.91','167','285'};
ans4 = str2num(char(inputdlg(plate4_prompt,dlg_title,num_lines,def_ans,options)));
fprintf('\nPlate 4 done..');
%PLATE 5
plate5_prompt ={'LENGTH(mm)::','BREADTH(mm)','THICKNESS(mm)',...
    'ABSORPTIVITY(internal)','EMISSIVITY(internal)','ABSORPTIVITY(external)','EMISSIVITY(external)'...
    'DENSITY(kg/m3)','SPECIFIIC HEAT (Cp)(kJ/kg K)','THERMAL CONDUCTIVITY(W/mK)','INITIAL TEMP(K)'};
dlg_title = '::PLATE 5::';
num_lines = 1;
%aluminium surface property is given 0.8 because of prescence of solar cell
%internal surf prop due to normally black coating on the inside
def_ans = {'200','100','5','0.8','0.8','0.8','0.8','2700','0.91','167','285'};
ans5 = str2num(char(inputdlg(plate5_prompt,dlg_title,num_lines,def_ans,options)));
fprintf('\nPlate 5 done..');
%PLATE 6
plate6_prompt ={'LENGTH(mm)::','BREADTH(mm)','THICKNESS(mm)',...
    'ABSORPTIVITY(internal)','EMISSIVITY(internal)','ABSORPTIVITY(external)','EMISSIVITY(external)'...
    'DENSITY(kg/m3)','SPECIFIIC HEAT (Cp)(kJ/kg K)','THERMAL CONDUCTIVITY(W/mK)','INITIAL TEMP(K)'};
dlg_title = '::PLATE 6::';
num_lines = 1;
%aluminium surface property is given 0.8 because of prescence of solar cell
%internal surf prop due to normally black coating on the inside
def_ans = {'100','100','6','0.8','0.8','0.8','0.8','2700','0.91','167','285'};
ans6 = str2num(char(inputdlg(plate6_prompt,dlg_title,num_lines,def_ans,options)));
fprintf('\nPlate 6 done..');

%ASSIGN ANSWER 1 - 6 TO THE RESPECTIVE VARIABLES
l1 = ans1(1); b1 = ans1(2); t1 = ans1(3); s2a1 = ans1(4); s2e1 = ans1(5); s1a1 = ans1(6); s1e1 = ans1(7); density1 = ans1(8)*1e-9; cp1 = ans1(9)*1e3; k1 = ans1(10)*1e-3; s1t1 = ans1(11); s2t1 = ans1(11);
l2 = ans2(1); b2 = ans2(2); t2 = ans2(3); s2a2 = ans2(4); s2e2 = ans2(5); s1a2 = ans2(6); s1e2 = ans2(7); density2 = ans2(8)*1e-9; cp2 = ans2(9)*1e3; k2 = ans2(10)*1e-3; s1t2 = ans2(11); s2t2 = ans2(11);
l3 = ans3(1); b3 = ans3(2); t3 = ans3(3); s2a3 = ans3(4); s2e3 = ans3(5); s1a3 = ans3(6); s1e3 = ans3(7); density3 = ans3(8)*1e-9; cp3 = ans3(9)*1e3; k3 = ans3(10)*1e-3; s1t3 = ans3(11); s2t3 = ans3(11);
l4 = ans4(1); b4 = ans4(2); t4 = ans4(3); s2a4 = ans4(4); s2e4 = ans4(5); s1a4 = ans4(6); s1e4 = ans4(7); density4 = ans4(8)*1e-9; cp4 = ans4(9)*1e3; k4 = ans4(10)*1e-3; s1t4 = ans4(11); s2t4 = ans4(11);
l5 = ans5(1); b5 = ans5(2); t5 = ans5(3); s2a5 = ans5(4); s2e5 = ans5(5); s1a5 = ans5(6); s1e5 = ans5(7); density5 = ans5(8)*1e-9; cp5 = ans5(9)*1e3; k5 = ans5(10)*1e-3; s1t5 = ans5(11); s2t5 = ans5(11);
l6 = ans6(1); b6 = ans6(2); t6 = ans6(3); s2a6 = ans6(4); s2e6 = ans6(5); s1a6 = ans6(6); s1e6 = ans6(7); density6 = ans6(8)*1e-9; cp6 = ans6(9)*1e3; k6 = ans6(10)*1e-3; s1t6 = ans6(11); s2t6 = ans6(11);
a1 = l1*b1; a2 = l2*b2; a3 = l3*b3; a4 = l4*b4; a5 = l5*b5; a6 = l6*b6;
m1 = l1*b1*t1*density1;m2 = l2*b2*t2*density2;m3 = l3*b3*t3*density3;m4 = l4*b4*t4*density4;m5 = l5*b5*t5*density5;m6 = l6*b6*t6*density6;
stf_blt = 5.67e-2;
fprintf('\n Calculate view factors between parallel plates...');
vf16=vf_1pll6(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f35=vf_3pll5(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f24=vf_2pll4(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
fprintf('\n Loaded parallel faces view factors...');
fprintf('\n Calculating view factors between perpendicular plates...');
vf12=vf_1pa2(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
vf13=vf_1pa3(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
vf14=vf_1pa4(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
vf15=vf_1pa5(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f23=vf_2pa3(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f25=vf_2pa5(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f26=vf_2pa6(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f34=vf_3pa4(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f36=vf_3pa6(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f45=vf_4pa5(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f46=vf_4pa6(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
f56=vf_5pa6(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6);
%internal areas
ia1=(l1-t3-t5)*(b1-t2-t4);
ia2=l2*(b2-t5-t3);
ia3=l3*(b3-t2-t4);
ia4=l4*(b4-t5-t3);
ia5=l5*(b5-t2-t4);
ia6=(l6-t3-t5)*(b6-t2-t4);
%reciprocity relations
vf11=0;f21=(ia1/ia2)*vf12; f22=0;  f33=0;  f44=0;  f55=0; f66=0;f31=ia1/ia3*vf13; f32=ia2/ia3*f23;f43=ia3/ia4*f34;f54=ia4/ia5*f45;
f41=ia1/ia4*vf14; f42=ia2/ia4*f24;f53=ia3/ia5*f35;f65=ia5/ia6*f56;f51=ia1/ia5*vf15; f52=ia2/ia5*f25;f63=ia3/ia6*f36;f61=ia1/ia6*vf16; f62=ia2/ia6*f26; f64 = ia4/ia6*f46;
fprintf('\n Loaded perpendicular faces view factors...');
notifyme = true;
% imshow('sate_image.jpg');
fprintf('\n Will clear command window in 5 seconds');
pause(2);
 clc; label;
while notifyme    
    fprintf('\n ::General Notifications:: \n 1. The radiation loads that you will provide next will be directly used with suitable cosine components. \n    consider any conversions etc (if required)');    
    fprintf('\n 2. The program will deduct 23.5d from satellite lattitude pos you provide to compensate earth"s axis tilt');
    fprintf('\n 3. Provide reasonable time step to ensure quick but accurate computations');
    fprintf('\n 4. When asked for, provide a crude value for lowest temperature that you will say satellite may reach (default is 100K)');    
    fprintf('\n 5. Axis of rotation::\n   A. plate 2 through plate 4 (default-ONLY OPTION)\n   B. plate 1 through 6  <NEXT VERSION>\n   C. plate 5 through 3 <NEXT VERSION>\n');
    notifyme = false;
end
fprintf('\n Load Mission Parameters...Launching input dialog');
mission_prompt = {'Ambient Temperature(K)','Launch Day(jan1=1,jan31=31,feb1=32...)','Earth Radiation Load (IR)','Albedo Factor','Orbit Height(km)','Orbit Orientation Angle(d)','Satellite Pos (0-360)','Time required for one rotation(s)'};
def_ans = {'5','45','237','0.33','350','22.5','23.5','15'};
dlg_title = 'Mission Parameters';
ans_msn = str2num(char(inputdlg(mission_prompt,dlg_title,num_lines,def_ans,options)));
amb = ans_msn(1); day1 = ans_msn(2); erad = ans_msn(3)*1e-6; alb_f = ans_msn(4); o_ht = ans_msn(5); Be = ans_msn(6); sat_pos_orbit_earth = ans_msn(7);time_1_rot= ans_msn(8);
time_elapsed = 0;
sat_pos_axis = 0;
%SATELLITE POSITION WRTO EARTH
sat_pos_orbit = sat_pos_orbit_earth -23.5;
if sat_pos_orbit < 0
    sat_pos_orbit = sat_pos_orbit + 360; %find the actual relevant satellite position
end
ref_pos = sat_pos_orbit;
 clc; label;
fprintf('\n Loading other necessary data...');
cr_prompt = {'Contact Resistance(m2.K/W) btn 1 & 2(= 1 to 4):','between 1 and 3 (= 1 to 5):','between 2 and 3 (= 2 to 5): '};
def_ans = {'5','5','5'};
dlg_title = '::Contact Resistances::';
ans_cr = str2num(char(inputdlg(cr_prompt,dlg_title,num_lines,def_ans,options)));
cr_p1top2 = ans_cr(1)*1e10;
cr_p1top3 = ans_cr(2)*1e10;
cr_p2top3 = ans_cr(3)*1e10;
cr_p2top5 = cr_p2top3;
cr_p4top5 = cr_p2top3;
cr_p6top3 = cr_p1top3;
cr_p6top2 = cr_p1top2;
cr_p1top4 = cr_p1top3;
cr_p3top4 = cr_p1top4;
cr_p1top5 = cr_p1top3;
cr_p6top4 = cr_p1top4;
cr_p6top5 = cr_p1top5;
cr_p1top5 = cr_p1top3;
calc_prompt = {'Unit Time Step:','Analysis required for (seconds)','% of radiation @ poles wrto equator','(crude)Worst Cold Case Temp(K)'};
def_ans = {'1','100','30','100'};
dlg_title = 'Calculation Parameters';
ans_cal = str2num(char(inputdlg(calc_prompt,dlg_title,num_lines,def_ans,options)));
utime = ans_cal(1); t_req = ans_cal(2);y1 = ans_cal(3); x0 = ans_cal(4);
x0 = [x0 x0 x0 x0 x0 x0];
o_tym=sqrt(4*(pi*pi)*(((6378.1+o_ht)*1000)^3)/(3.986*(10^14)));        %orbit time calculated is in seconds
b = 2*pi*day1/365;
sat_pos_axis_u = (utime *360)/(time_1_rot); %step in which angles change wrt step time
sat_pos_orbit_u = (utime*360)/(o_tym);

%defining zones
%sangle = shadow angle
sangle = acosd(6378.1/(6378.1+o_ht));
cntr = 1;
temp_mat(1,cntr) = s1t1;temp_mat(2,cntr) = s1t2;temp_mat(3,cntr) = s1t3;temp_mat(4,cntr) = s1t4;temp_mat(5,cntr) = s1t5;temp_mat(6,cntr) = s1t6;
% fprintf('\nthis is x0 created');
% disp(x0);
save('rtime.mat','temp_mat','sat_pos_orbit','sat_pos_axis','cntr')
save('f_run_var.mat') %save first run variables to be used later if reqd