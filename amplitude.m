function [t_vek, x, theta, phi, x_dot, theta_dot, phi_dot] = amplitude(t_max,d,l,R,g,m1,m2,m3)
% Solves first order diffs. with ode45

options = odeset('RelTol', 1e-06, 'AbsTol', 1e-10);

% Start values
y0=[0,0,pi/4,0,pi,0];

[t_vek,Y]=ode45(@(t,y)diffekv(y,d,l,R,g,m1,m2,m3),[0 t_max],y0,options); 
x = Y(:,1);
theta = Y(:,3);
phi = Y(:,5);

x_dot = Y(:,2);
theta_dot = Y(:,4);
phi_dot = Y(:,6);
