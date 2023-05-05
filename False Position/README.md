This MATLAB code implements the False Position Method by iterating to find the root of a function by bracketing between two initial guesses and then narrowing the search interval. 
The inputs of this function are func (the given function), xl (the lower bound), xu (the upper bound), maxit (the maximum number of iterations defaulted to 200 ), es (the relative error of 0.0001%), varargin (additional parameters). 
The outputs of this function are root (the estimated root), fx (the function evaluated at the root), ea (the approximate relative error), and iter (the number of iterations performed). 
Ex)testFunc = @(x) x.^3; % the root for this is pretty clearly x=0

% now lets test the function, using default value for es
x_left = -1;
x_right = 1;
[root, fx, ea, iter] = falsePosition(testFunc, x_left, x_right)
