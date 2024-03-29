function O = DOG(I, F_size, sig1,sig2)

% Check number of inputs.
if nargin > 4
    error('myfuns:somefun2:TooManyInputs', ...
        'requires at most 3 optional inputs');
end

% Fill in unset optional values.
switch nargin
    case 2
        dev = 1;
        sig1=dev/sqrt(2);
        sig2=sqrt(2)*dev;
    case 3
        sig2 = 2*sig1;

end


ind = -floor(F_size/2) : floor(F_size/2);
[X, Y] = meshgrid(ind, ind);

%// Create Gaussian Mask
h = exp(-(X.^2 + Y.^2) / (2*sig1*sig1));

%// Normalize so that total area (sum of all weights) is 1
Gauss1 = h / sum(h(:));

ind = -floor(F_size/2) : floor(F_size/2);
[X, Y] = meshgrid(ind, ind);

%// Create Gaussian Mask
h = exp(-(X.^2 + Y.^2) / (2*sig2*sig2));

%// Normalize so that total area (sum of all weights) is 1
Gauss2 = h / sum(h(:));

out_gauss = Gauss1 - Gauss2;

out = conv2(I,out_gauss,"same");

O = out;
