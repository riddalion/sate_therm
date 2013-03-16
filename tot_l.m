function tot_l = tot_l(sat_pos_orbit,sat_pos_axis,b,y1,alb_f,erad,Be)
%this one generates solar loads taking input of angles and other params
%solar loads variying lineraly from equator to the poles y1 is least % of
%load @ equator and y1 is at the poles (hope you understood!)
if sat_pos_orbit >= 0 && sat_pos_orbit <= 90
    s =  (1367e-6)*(1.00011+0.034221*cosd(2*b))*(((y1-100)/90)*sat_pos_orbit+100)/100; %y1 is generally a number 0-100
elseif sat_pos_orbit > 90 && sat_pos_orbit <= 270
    s =  (1367e-6)*(1.00011+0.034221*cosd(2*b))* y1/100;
elseif sat_pos_orbit >270 && sat_pos_orbit < 360
    s =  (1367e-6)*(1.00011+0.034221*cosd(2*b))*(-((y1-100)/90)*(sat_pos_orbit-180)+100)/100; %y1 is generally a number 0-100
else
    s = 0;
end
solr = s*cosd(sat_pos_axis)*cosd(Be); %solar load has been taken care in all zones
if sat_pos_axis > 90 && sat_pos_axis <270
    solr = 0;
end
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
%total loads
tot_l=solr+alb_diff+alb_dir+earth_diff+earth_dir; %just multiply this thing for all plates