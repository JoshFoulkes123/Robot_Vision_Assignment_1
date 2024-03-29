function O = convolve(F,I)

F_size = size(F,1);
zero_pad = ((F_size)-1)/2;
padded_I = padarray(I,[zero_pad zero_pad],0,'both');

out = zeros(size(I,1),size(I,2));

for i = 1 : size(I,1)
    for j = 1 : size(I,2)
        A = double(padded_I(i:i+F_size-1,j:j+F_size-1));
        out(i,j) = sum(dot(A,F));
    end
end

O = out;


