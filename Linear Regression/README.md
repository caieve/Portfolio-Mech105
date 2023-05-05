This MATLAB code computes a linear regression line for given data while eliminating outliers and also calculating the R^2 value.

The inputs include an independent variable array (x) and a dependent variable array (y)
The outputs include a sorted x array without outliers, the slope and y-intercept of the linear regression, and the R^2 value

Ex)
x = [1 2 3 4 5 6]
y = [1 2 1.3 3.75 2.5 100]
% We should filter out x=6,y=100!
[fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)

% Actual values for your comparison:
xAnswer = [1 3 2 5 4]
yAnswer = [1 1.3 2 2.5 3.75]
slopeAnswer = 0.4750
interceptAnswer = 0.6850
RsquaredAnswer = 0.4758
