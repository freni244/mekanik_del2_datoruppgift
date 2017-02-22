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

[t_vek,x,theta,phi] = amplitude(t_max,d,l,R,g,m1,m2,m3);
% ovan returnerar xdot, thetadot & phidot.

subplot(3, 1, 1);
    plot(t_vek,x,'b') % amplitud x
    xlabel 't (s)'
    ylabel 'x (m)'
    title 'amplitude x'
    
subplot(3, 1, 2);
    theta_degree = theta*180/pi;
    plot(t_vek,theta_degree,'r') % amplitud theta
    xlabel 't (s)'
    ylabel 'theta °'
    title 'amplitude theta'
    
subplot(3, 1, 3);
    phi_degree = phi*180/pi;
    plot(t_vek,phi_degree,'g') % amplitud phi
    xlabel 't (s)'
    ylabel 'phi °'
    title 'amplitude phi'
    