function [ t, x ] = boosting_traj( dt, tf, x0, Isp, m0, mdot )
%ballistic_traj let's make some trajectories
%   make some ballistic trajectories
%
%   INPUTS:
%       dt - time step
%       tf - final time
%       x0 - initial state, [pos;vel] in m;m/s
%       Isp - specific impulse, seconds
%       m0 - mass, kg
%       mdot - mass flow rate, kg/s
%   OUTPUTS:
%       t - time
%       x - state, [pos;vel] in m;m/s

t = 0:dt:tf;
t = t';

n = size(t, 1);

x = zeros(9, n);
x(1:6, 1) = x0;
x(7, 1) = Isp;
x(8, 1) = m0;
x(9, 1) = mdot;

for idx = 2:n
    y0 = x(1:9, idx - 1);
        
    [~, x(:, idx)] = math_rk4(@traj_dxdt_boost, t(idx - 1), dt, y0);
    
    if x(8,idx) < 0
        x(8,idx) = 0;
    end
    
    if x(3,idx) < 0
      ntimes = idx-1;
      x = x(:,1:ntimes);
      t = t(1:ntimes);
      break;
    end
    
end



end

