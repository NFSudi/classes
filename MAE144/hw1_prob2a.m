clc; clear all; close all;
disp('Problem 2a')
b=RR_poly([-2 2 -5 5],1), a=RR_poly([-1 1 -3 3 -6 6],1), f=RR_poly([-1 -1 -3 -3 -6 -6],1)
[x,y] = RR_diophantine(a,b,f), test=trim(a*x+b*y), residual1=norm(f-test)
fprintf('D=y/x is not proper and residual is close to 0\n') %y/x is not proper
