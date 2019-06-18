function [ dx ] = traj_dxdt_boost( ~, x )
%traj_dxdt sets up derivatives for integrated boost trajectory
%   yuh


r = x(1:3);
v = x(4:6);
Isp = x(7);
m = x(8);
mdot = x(9);

g = gravity();

if m > 0
    a_thrust = (v / norm(v))*(abs(g)*Isp*mdot)/m;
else
    a_thrust = 0;
end
a_grav = g*[0;0;1];

accel = a_thrust + a_grav;

dx = [v;accel;0;-mdot;0];

end

