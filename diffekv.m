function ydot = diffekv(t,y,d,l,R,g,m1,m2,m3)
% Convets second order diff. to firs order, returnd in ydot.

% extracting x, x_dot, angles and angular velocitys from y
x = y(1);
x_dot = y(2);
theta = y(3);
theta_dot = y(4);
phi = y(5);
phi_dot = y(6);


A1 = [2*m1+m2+m3, (m2+m3)*d*cos(theta), -m3*0.5*l*sin(phi)];            % A-row from (1') 1x3 matrix
A2 = [(m2+m3)*d*sin(theta), 0.25*m2*R^2, -m3*d*0.5*l*cos(theta+phi)];    % A-row from (2')
A3 = [0.5*cos(phi), 0.5*d*cos(phi+theta), -l/3];                        % A-row from (3)

A = [A1;A2;A3]; % all rows in A 3x3 matrix

b1 = d*(m2+m3)*(theta_dot^2*sin(theta) + theta_dot*sin(theta) + cos(theta)) ...
    + 0.5*l*m3*(theta_dot^2*cos(phi) + 0.5*l*theta_dot*cos(phi) - sin(phi));                 % b from (1') 1x1 matrix
b2 = (m2+m3)*g*d*cos(theta) + (m1+m2)*d^2*(theta_dot^2+theta_dot) ...
    - m3*d*0.5*l*(phi_dot^2*phi_dot)*(sin(phi)+cos(phi));                                    % b from (2')
b3 = 0.5*g*sin(phi) + 0.5*(theta_dot^2+theta_dot)*d*sin(phi+theta) + 0.5*d*cos(phi+theta); % b from (3)

b = [b1;b2;b3]; % all of b, 3x1 matrix

z = A\b; % solves equation. Returns x_dot_dot, theta_dot_dot & phi_dot_dot in kolumn z.

ydot = zeros(6,1);
ydot(1) = x_dot;
ydot(2) = z(1); % x_dot_dot as first order diff.
ydot(3) = theta_dot;
ydot(4) = z(2); % theta_dot_dot
ydot(5) = phi_dot;
ydot(6) = z(3); % phi_dot_dot

end
