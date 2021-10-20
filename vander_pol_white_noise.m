clear;
close all;
clc;

global W tspan beta epsilo w_0 tspan_1

tspan = linspace(0,100,100);
beta = 1;
epsilo = 2;
w_0 = 1;

W = 2*randn(size(tspan));
tspan_1 = linspace(0,100,3000);

% initial condition
x0=0;
xd0=0;
xv0=[x0,xd0];

[t,x]=ode45(@randdx,tspan_1,xv0);

figure(1)
plot(t,x(:,1))

function dx = randdx(t,x)
    global W tspan beta epsilo w_0
    Wt=interp1(tspan,W,t);
    dx = [x(2); Wt-(beta*(-1+epsilo*x(1)^2)*x(2)+w_0^2*x(1))];
end
