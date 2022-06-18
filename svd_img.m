function M = svd_img(A, r)
    % Approximate, via Singular Value Decomposition, an RGB matrix by another with lower rank.
    % A (n by m by 3 matrix) original RGB matrix
    % r (integer) custom rank of the approximated matrix
    % M (n by m by 3 matrix) approximated RGB matrix
    [R, G, B] = rgb(A);
    R = approximate(R, r);
    G = approximate(G, r);
    B = approximate(B, r);
    M = picture(R, G, B);
end

function [R, G, B] = rgb(A)
    R = A(:, :, 1);
    G = A(:, :, 2);
    B = A(:, :, 3);
end

function M = approximate(A, r)
    [U, S, V] = svd(A);
    M = U(:, 1:r) * S(1:r, 1:r) * V'(1:r, :);
end

function M = picture(R, G, B)
    M(:, :, 1) = R;
    M(:, :, 2) = G;
    M(:, :, 3) = B;
end

