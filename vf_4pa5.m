function f45=vf_4pa5(l1, l2, l3, l4, l5, l6, b1, b2, b3, b4, b5, b6, t1, t2, t3, t4, t5, t6)
%function calculates fiew factors between perp plates 4 and 5
%nomenclature view factor_ plate to plate pa refers to perpendicular
H=l1-t2-t5;
L=b5;
W=b5-t2-t4;
h=H/L;
w=W/L;
a=(1+h*h).*(1+w.*w)/(1+h.*h+w.*w);
b=(w*w).*(1+h*h+w*w)/((1+w.*w).*(h.*h+w.*w));
c=(h*h).*(1+h*h+w*w)/((1+h.*h).*(h.*h+w.*w));
f45=1/(pi*w)*(h*atan(1/h)+w*atan(1/w)-sqrt(h*h+w*w)*atan(1/sqrt(h*h+w*w))+0.25*log(a*(b.^(w*w)).*(c.^(h*h))));
if f45 < 0
    fprintf('\n Negative view factor value detected. Force it to positive value');
    fprintf('\n f45');    
    f45 = 0 - f45;
end