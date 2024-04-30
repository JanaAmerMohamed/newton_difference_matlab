% Given data points
x = [1.6,2,2.5,3.2,4,4.5];
y = [2,8,14,15,8,2];

% Calculate Newton's divided difference coefficients
coeffs3 = divdiff(x(1:3), y(1:3));
coeffs4 = divdiff(x(1:4), y(1:4));
coeffs5 = divdiff(x, y);

% Evaluate interpolation polynomials at x = 2.8
x_eval = 2.8;
f_interp3 = polyval(coeffs3, x_eval - x(1));
f_interp4 = polyval(coeffs4, x_eval - x(1));
f_interp5 = polyval(coeffs5, x_eval - x(1));

fprintf('f(2.8) using Newton''s divided difference interpolation of degree 3: %.4f\n', f_interp3);
fprintf('f(2.8) using Newton''s divided difference interpolation of degree 4: %.4f\n', f_interp4);
fprintf('f(2.8) using Newton''s divided difference interpolation of degree 5: %.4f\n', f_interp5);

% Function to calculate Newton's divided difference coefficients
function coeffs = divdiff(x, y)
    n = length(x);
    coeffs = y;

    for j = 2:n
        for i = n:-1:j
            coeffs(i) = (coeffs(i) - coeffs(i - 1)) / (x(i) - x(i - j + 1));
        end
    end
end
