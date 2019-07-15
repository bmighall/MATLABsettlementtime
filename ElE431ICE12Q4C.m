%Ben Mighall, 
%Team Members: Jing Wang, Shaila Collins, Matt Weeden
%El E 431 Spring 2018
%In-Class Exercise #12, Question 4C 

%Matlab program that solves for x=-ln(0.02/(1+x)), where x = w_n*T_s, using
%successive approximations and starting with an arbitrary positive value
%for x_0. Program is used to determine the 2% settling time for a standard
%2nd order system with a damping ratio of 1 (critically damped)

clear all;
close all;

x_0 = 0.1;
i = 1; 
f = @(x) -1*log(0.02/(1+x));
while (1)
    x_0(i+1) = f(x_0(i)); 
    error = abs((x_0(i+1)-x_0(i))/x_0(i)); 
    if error < 0.1*10^-7
        x_0(i+1) = f(x_0(i)); 
        fprintf('-------------------------------------------------------------\n');
        fprintf('\nIteratively solving x=-ln(0.02/(1+x)), where x = w_n*T_s...');
        fprintf('\n\nInitial Guess:\t0.1');
        fprintf('\n\nValue result:');
        disp(x_0(i+1));
        fprintf('Number of Iterations:');
        disp(i);
        fprintf('-------------------------------------------------------------\n');
        break
    end
    i = i + 1; 
end