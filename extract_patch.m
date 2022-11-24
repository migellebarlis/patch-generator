function pat = extract_patch(im, n)
% Compute the variance of each patch
var = (conv2(im .^ 2, ones(n), 'valid') - (conv2(im, ones(n), 'valid') .^2 ) / n ) / n;

% Locate the greatest variance
[mx, ind] = max(var, [], 'all');
[r, c] = ind2sub(size(var), ind);

% Take the patch based on the location
pat = im(r:r + n - 1, c:c + n - 1);

end
