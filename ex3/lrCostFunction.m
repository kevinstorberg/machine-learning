function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
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
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%
%z = X * theta;
%h = sigmoid(z);
%J = (1 / m) * sum( -y' * log(h) - (1 - y)' * log( 1 - h) ) + (lambda /(2*m) ) * sum((theta .* [0; ones(length(theta) - 1, 1)]) .^2);

%reg_term = [0 (lambda*theta(2:end)/m)'];
%grad = sum(X.*(sigmoid(X*theta) - y)) / m + reg_term;

%Hypotheses
hx = sigmoid(X * theta);

%%The cost without regularization
J_partial = (-y' * log(hx) - (1 - y)' * log(1 - hx)) ./ m;


%%Regularization Cost Added
J_regularization = (lambda/(2*m)) * sum(theta(2:end).^2);

%%Cost when we add regularization
J = J_partial + J_regularization;

%Grad without regularization
grad_partial = (1/m) * (X' * (hx -y));

%%Grad Cost Added
grad_regularization = (lambda/m) .* theta(2:end);

grad_regularization = [0; grad_regularization];

grad = grad_partial + grad_regularization;




% =============================================================

%grad = grad(:);

end
