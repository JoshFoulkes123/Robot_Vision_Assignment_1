clear all
close all

Kernel = [-1,-1,-1;-1,8,-1;-1,-1,-1];

image = [121,109,125,115,103;
         155,78,118,112,178;
         11,6,18,13,16;
         7,7,22,16,26;
         3,7,17,18,17];

out = zeros(3);
for  i =1 : 3
    for j = 1:3
        r = image(i:i+2,j:j+2);
        out(i,j) = sum(dot(Kernel,r));
    end
end

out
