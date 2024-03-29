function O = simpleMedian(W,H,I)

zero_pad_w = ((W)-1)/2;
zero_pad_h = ((H)-1)/2;
padded_F = padarray(I,[zero_pad_h zero_pad_w],0,'both');

out = zeros(size(I,1),size(I,2));

for i = 1 : size(I,1)
    for j = 1 : size(I,2)
        A = double(padded_F(i:i+H-1,j:j+W-1));
        B = reshape(A,1,[]);
        C = sort(B);
        out(i,j) = C(ceil(size(C,2)/2));
    end
end

O = out;

