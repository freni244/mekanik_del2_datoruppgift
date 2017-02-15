clear
clf

R = 1;
l = 3;
d = 4*R/(3*pi);
m1 = 1;
m2 = 2;
m3 = 3;
g = 9.82;
t_max = 35; 

[xdot,thetadot,phidot] = amplitude(t_max,d,l,R,g,m1,m2,m3);
% ovan returnerar xdot, thetadot & phidot.

