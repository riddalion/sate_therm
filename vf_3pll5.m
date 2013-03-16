function f35=vf_3pll5(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6)
%INTAKE VARIABLES ARE DECLARED GLOBAL THEY MUST BE AVALABLE EVERYWHERE
%WHEREEVER THE CONTROL FLOWS
%view factor for parallel rectangular identical plates
%nomenclature: vf_3pll5 read as view factor for surface 3 parallel to
%surface 5
%the view factor is in 3 cases 1||6 and 3||5 and 2||4
w1=(l3-t1-t6);
w2=(b2-t2-t4);
H=(b2-t3-t5);
x=w1/H;
y=w2/H;
x1=sqrt(1+x.^2);
y1=sqrt(1+y.^2);
f35=(1/(pi*x*y))*(log((x1.^2)/(x1.^2+y1.^2-1))+2*x*(y1*atan(x/y1)-atan(x))+2*y*(x1*atan(y/x1)-atan(y)));
if f35 < 0
        fprintf('\n Negative view factor value detected. Force it to positive value');
    fprintf('\n f35');    
    f35 = 0 - f35;
end