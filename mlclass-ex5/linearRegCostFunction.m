function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%



T1 = X * theta;
T2 = T1 - y;
T3 = T2 .^ 2;

S = sum (T3);

J = S / (2*m);

L = 0;
for j = 2:size(theta, 1)
  grad(j) = sum( ((X * theta) - y) .* X(:, j))/m + lambda * theta(j) / m;
  L += theta(j)^2;
endfor
J += (lambda / 2 / m) * L;

% =========================================================================

grad(1) = sum( ((X * theta) - y) .* X(:, 1) ) / m;
grad = grad(:);

end
