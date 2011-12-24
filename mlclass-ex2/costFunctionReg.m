function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


for i = 1:m
  Jplus = -y(i)*log( sigmoid( X(i, :) * theta ) );
  Jminus = -(1 - y(i) )*log( 1 - sigmoid( X(i, :) * theta ) );
  Jt = Jplus + Jminus;
  J += Jt;
endfor
J = J / m;
L = 0;

for j = 2:size(theta, 1)
  grad(j) = sum( (sigmoid(X * theta) - y) .* X(:, j)) + lambda * theta(j);
  L += theta(j)^2;
endfor
J += (lambda / 2 / m) * L;

grad(1) = sum( (sigmoid(X * theta) - y) .* X(:, 1) );
  
grad = grad./ m;


% =============================================================

end
