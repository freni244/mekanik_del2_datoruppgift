function anim_y2_2017 (t,x,theta,phi,R,l,d,t_scale)
%Animation routine for computer assignment in Mekanik Y, del 2, 2017.
%Input:
%Vector x, theta and phi holding the values of "x", "theta" and "phi" for the instants of time
%given in the vector t (output from ode45).
%R is the radius of the ring and the disc.
%d=4*R/(3*pi) gives the location of the center of gravity of the disc.
%l is the length of the bar.
%t_scale determines the time scale of the animation. t_scale=1 implies that
%the animation is done without changing the time scale. t_scale=10
%implies that the animation will take 10 times *longer*.



%Clear current figure:
clf


%Calculate coordinates of point G2:
x_g2=x+d*cos(theta);
y_g2=-d*sin(theta);

%Calculate corner points of the disc:
x_1=x-0.9*R*sin(theta);
y_1=-0.9*R*cos(theta);
x_2=x+0.9*R*sin(theta);
y_2=0.9*R*cos(theta);

%Calculate coordinates of the free end point of the bar:
x_e=x_g2+l*sin(phi);
y_e=y_g2-l*cos(phi);


axis equal
axis([min(x)-R-l,max(x)+R+l,-R-l,R+l])  



ang=linspace(0,2*pi,50);
ang2=linspace(theta(1),theta(1)+pi,50);


l0=line([x(1)+R*cos(ang)],[R*sin(ang)],'LineWidth',1.5,'Color','Green');
l1=line([x(1)+0.9*R*sin(ang2)],[0.9*R*cos(ang2)],'LineWidth',1.5,'Color','Blue');
l2=line([x_1(1) x_2(1)],[y_1(1) y_2(1)],'LineWidth',1.5,'Color','Blue');
l3=line([x_g2(1) x_e(1)],[y_g2(1) y_e(1)],'LineWidth',2,'Color','Black');
l4=line([x(1)+R*sin((x(1)-x(1))/R) x(1)+1.15*R*sin((x(1)-x(1))/R)], ...
    [R*cos((x(1)-x(1))/R) 1.15*R*cos((x(1)-x(1))/R)],'LineWidth',1.5,'Color','Green');

t1=text(max(x)+0.0*R+0.8*l,0.5*R+l,['Tid: ' num2str(t(1),'%4.1f')]);


t0=clock;
for i=2:length(t)
    
    
    ang2=linspace(theta(i),theta(i)+pi,50);
    
    l0.XData=[x(i)+R*cos(ang)];
    l0.YData=[R*sin(ang)];
    l1.XData=[x(i)+0.9*R*sin(ang2)];
    l1.YData=[0.9*R*cos(ang2)];
    l2.XData=[x_1(i) x_2(i)];
    l2.YData=[y_1(i) y_2(i)];
    l3.XData=[x_g2(i) x_e(i)];
    l3.YData=[y_g2(i) y_e(i)];
    l4.XData=[x(i)+R*sin((x(i)-x(1))/R) x(i)+1.15*R*sin((x(i)-x(1))/R)];
    l4.YData=[R*cos((x(i)-x(1))/R) 1.15*R*cos((x(i)-x(1))/R)];
    
    t1.String=['Tid: ' num2str(t(i),'%4.1f')];
    
    while etime(clock,t0)<t_scale*t(i),end %Wait to plot until t_scale*t(i) seconds have
                                           %elapsed since start of animation. 
    drawnow update
    
end


