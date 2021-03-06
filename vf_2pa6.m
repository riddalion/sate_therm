function f26=vf_2pa6(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6)
%function calculates fiew factors between perp plates 2 and 6
%nomenclature view factor_ plate to plate pa refers to perpendicular
H=b6-t2-t4;
L=l6-t4-t5;
W=l2;
h=H/L;
w=W/L;
a=(1+h*h).*(1+w.*w)/(1+h.*h+w.*w);
b=(w*w).*(1+h*h+w*w)/((1+w.*w).*(h.*h+w.*w));
c=(h*h).*(1+h*h+w*w)/((1+h.*h).*(h.*h+w.*w));
f26=1/(pi*w)*(h*atan(1/h)+w*atan(1/w)-sqrt(h*h+w*w)*atan(1/sqrt(h*h+w*w))+0.25*log(a*(b.^(w*w)).*(c.^(h*h))));
if f26 < 0
    fprintf('\n Negative view factor value detected. Force it to positive value');
    fprintf('\n f26');    
    f26 = 0 - f26;
end