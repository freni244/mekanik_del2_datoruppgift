function [x, theta, phi] = amplitude(t_max,d,l,R,g,m1,m2,m3)

options = odeset('RelTol', 1e-06, 'AbsTol', 1e-10);

% Start values
y=[0,0,pi/4,0,pi,0];

%for jj = 1:length(f)
    [t_vek,Y]=ode45(@(t,y)diffekv(t,y,d,l,R,g,m1,m2,m3), ...
        [0 t_max],zeros(1,6),options);
%    n = length(t_vek);
    
    x = Y(:,1);
 %   x_ampl(jj) = (max(x)-min(x))/2;
 
 theta = Y(:,2);
 phi = Y(:,3);