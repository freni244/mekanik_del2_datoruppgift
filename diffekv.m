function ydot = diffekv(y,d,l,R,g,m1,m2,m3)
% Convets second order diff. to firs order, returnd in ydot.
% (these are later solved by ode45)

% extracting x, x_dot, angles and angular velocitys from y
x = y(1);
x_dot = y(2);
theta = y(3);
theta_dot = y(4);
phi = y(5);
phi_dot = y(6);

% Rows in A-matrix, containing coefficients to x_dot_dot etc in (1'),(2')&3
A1 = [2*m1+m2+m3, -(m2+m3)*d*sin(theta), 1/2*m3*l*cos(phi)];
A2 = [(m2+m3)*d*sin(theta), 1/4*m2*R^2 + m2*d^2-(m2+m3)*d^2, 1/2*m3*d*l*sin(theta+phi)];
A3 = [cos(phi),-d*sin(theta+phi),2/3*l];

% "non-coefficient" parts of diff. (1'),(2') & 3
b1 = (m2+m3)*d*theta_dot^2*cos(theta) + 1/2*m3*l*phi_dot^2*sin(phi);
b2 = (m2+m3)*g*d*cos(theta)-1/2*m3*d*l*phi_dot^2*cos(phi_dot+phi);
b3 = g*sin(phi) + d*theta_dot^2*cos(phi+theta);
   
A = [A1;A2;A3]; % all rows in A 3x3 matrix
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
