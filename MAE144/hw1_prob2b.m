clear; clc; close all;
disp('Problem 2b')
b=RR_poly([-2 2 -5 5],1), a=RR_poly([-1 1 -3 3 -6 6],1)
f=RR_poly([-1 -1 -3 -3 -6 -6 -20 -20 -20 -20 -20],1)
[x,y] = RR_diophantine(a,b,f), test=trim(a*x+b*y), residual1=norm(f-test)
fprintf('The controller in 2a was improper. I added 5 roots (s=-20) to the target f. x increased its roots from 3 to 5. x and y now have 5 roots and make D proper\n')
