function [ dx ] = traj_dxdt_ballistic( ~, x )
%traj_dxdt sets up derivatives for integrated ballistic trajectory
%   yuh


r = x(1:3);
rhat = r/norm(r);
v = x(4:6);

g = gravity();

accel = g*[0;0;1];

dx = [v;accel];

end

