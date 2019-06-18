function [ t, x ] = math_rk4( f, t0, dt, x0 )
%math_rk4 Runge-Kutta ODE integration
%   INPUTS
%       f - function to be integrated f(t0, x0)
%       t0 - time of integration
%       dt - timestep of integration
%       x0 - state at time t0
%   OUTPUTS
%       t - new time (t = t0+dt)
%       x - new state 

k1 = dt * f(t0, x0);

x = x0 + 0.5*k1;
t = t0 + 0.5*dt;

k2 = dt * f(t, x);

x = x0 + 0.5*k2;

k3 = dt * f(t, x);

x = x0 + k3;
t = t0 + dt;

k4 = dt*f(t, x);

x = x0 + (k1 + 2*k2 + 2*k3 + k4)/6.0;


end

