% Solution to a problem asking to find displacement of a point on string of length l
% u(x,t) represents the displacement of a point on the string
% Given that d2u/dt2 = c^2 * d2u/dx2 and u(x, 0) = 2x(1-x)
% String is released from rest
% Asked to use Method of Difference and Central Difference Approximation to get and equation

clear all;
clc;

%given parameters
c = 1;
L = 1;
T = 1;
dx = 0.1;
dt = 0.1;

N = L/dx;
M = T/dt;
x = [0:dx:L];         % X axis for the graph
t(1) = 0;
k = (dt*dt)/(dx*dx);  %

for(i=2:M+2)
  t(i) = (i-2)*dt;
end

for(i=1:N+1)
  u1(i) = 2*x(i)*(1-x(i));   % given function
end

u0 = u1;

for(i=2:M+1)
  for(j=2:N)
    % found using Central Difference Approximation on both uxx and utt
    u2(j) = 2*u1(j) - u0(j) + k*(u1(j+1) - 2*u1(j) + u1(j-1));
  endfor
  u2(1) = 0;
  u2(N+1) = 0;
  u1(1) = 0;
  u1(N+1) = 0;
  u0 = u1;
  u1 = u2;
 endfor

 plot(x, u2);   % Plot of u vs x at T = 1s
