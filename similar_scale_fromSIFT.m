function [A, S] = similar_scale_fromSIFT(param4)

A = zeros(size(param4, 1), 4);  

cos_psi = cos(-param4(:, 2));% this is correct -
sin_psi = sin(-param4(:, 2));

A(:, 1) = cos_psi;
A(:, 2) = -sin_psi;
A(:, 3) = sin_psi;
A(:, 4) = cos_psi;
% [A(1) A(2)
% A(3) A(4)]

S=param4(:,1); 