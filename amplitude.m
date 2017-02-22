function [t_vek, x, theta, phi] = amplitude(t_max,d,l,R,g,m1,m2,m3)

options = odeset('RelTol', 1e-06, 'AbsTol', 1e-10);

% Start values
y0=[0,0,pi/4,0,pi,0];

[t_vek,Y]=ode45(@(t,y)diffekv(t,y,d,l,R,g,m1,m2,m3),[0 t_max],y0,options); 

x = Y(:,1);
theta = Y(:,3);
phi = Y(:,5);