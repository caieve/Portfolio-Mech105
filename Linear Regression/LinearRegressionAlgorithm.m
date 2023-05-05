function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set

%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

% Error message
if numel(x)~=numel(y)
    error('X and Y are not the same size');
end

% Sort x and y
[fY, order] = sort(y);
fX = x(order);

% Filter outliers for y
n = numel(fX);
L = floor((n+1)/4);
U = floor((3*n+3)/4);
Q1 = fY(L);
Q3 = fY(U);
IQR = Q3 - Q1;

outl_y = fY>(Q3 + (1.5*IQR)) | fY<(Q1 - (1.5*IQR));
fX = fX(~outl_y); 
fY = fY(~outl_y);

% Calculate slope 
mean_x = mean(fX);
mean_y = mean(fY);
SSx = sum((fX-mean_x).^2);
SP = sum((fX-mean_x).*(fY-mean_y));
slope = SP/SSx;

% Calculate intercept 
intercept = mean_y - slope.*(mean_x);
fxi = slope*fX + intercept;

% Calculate R^2
SSy = sum((fY-mean_y).^2);
SSr = sum((fY-fxi).^2);
Rsquared = 1-(SSr/SSy);
end