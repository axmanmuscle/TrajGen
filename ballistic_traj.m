function [ t, x ] = ballistic_traj( dt, tf, x0 )
%ballistic_traj let's make some trajectories
%   make some ballistic trajectories
%
%   INPUTS:
%       dt - time step
%       tf - final time
%       x0 - initial state, [pos;vel] in m;m/s
%   OUTPUTS:
%       t - time
%       x - state, [pos;vel] in m;m/s

t = 0:dt:tf;
t = t';

n = size(t, 1);

x = zeros(6, n);
x(1:6, 1) = x0;

for idx = 2:n
    y0 = x(1:6, idx - 1);
        
    [~, x(:, idx)] = math_rk4(@traj_dxdt_ballistic, t(idx - 1), dt, y0);
    
    if x(3,idx) < 0
      ntimes = idx-1;
      x = x(:,1:ntimes);
      t = t(1:ntimes);
      break;
    end
    
end



end

