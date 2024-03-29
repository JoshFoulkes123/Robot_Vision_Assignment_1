function [O, P] = Pyramid(I, F_size, N)

out{1} = DOG(I,F_size);

for i = 2 : N
    in = imresize(I,0.5^(i-1));
    out{i} = DOG(in,F_size);
end



m = size(out{1}, 1);
newI = out{1};
for i = 2 : numel(out)
    n = m - size(out{i}, 1); 
    currI = out{i};
    currI = [zeros(n,size(out{i}, 2));currI];
    newI = [newI, currI];
end

O = out;
P = newI;