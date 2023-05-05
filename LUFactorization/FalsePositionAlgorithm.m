
function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

if nargin < 3
    error('more inputs required, include func, xl, and xu')
end
if nargin < 4
    es = 0.0001;
    maxit = 200;
end
if nargin < 5
    maxit = 200;
end

iter = 0;
ea = 100;
root_old = xu;

while ea > es && iter < maxit
    iter = iter + 1;
    fxl = func(xl);
    fxu = func(xu);
    root = xu - ((fxu*(xl-xu))/(fxl-fxu));
    fx = func(root);
    if fx == 0
        ea = 0;
    else
        ea = (abs(root - root_old) / abs(root)) * 100;
    end
    if fx < 0 && fxl < 0
        xl = root;
    elseif fx > 0 && fxl > 0
        xl = root;
    else
        xu = root;
    end
    root_old = root;
end
end
function y = myfunc(x)
y = x^3;
[root, fx, ea, iter] = falsePosition(@myfunc, -1, 1);
end