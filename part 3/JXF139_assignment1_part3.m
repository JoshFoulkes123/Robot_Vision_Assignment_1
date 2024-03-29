clear all
close all

%%%%%load images
checker = imread("checkerboardPhoto.png");
circle = imread("circlePhoto.png");

% checker_bw = rgb2gray(checker);
% circle_bw = rgb2gray(circle);

%%%%%3.1
m=0;
s=5;
h=7;
Gauss_filter = N(m,s,-h:1:h)'*N(m,s,-h:1:h);

out = convolve(Gauss_filter,checker);
show_image(out)

%%%%%3.2
Box_filter = ones(15)/225;

out = convolve(Box_filter,checker);
show_image(out)

%%%%%%3.3
out = simpleMedian(15,15,checker);
show_image(out)

%%%%%3.4
Malards = imread("Malards_in_Golden_Gate_Park.jpg");
Malards_bw = rgb2gray(Malards);

SP_noise = imnoise(Malards_bw,"salt & pepper",0.075);
G_noise = imnoise(Malards_bw,'gaussian',0.1,0.15);

SP_noise_Gau = convolve(Gauss_filter,SP_noise);
SP_noise_Gau =  uint8((255/max(max(SP_noise_Gau)))*SP_noise_Gau);
G_noise_Gau = convolve(Gauss_filter,G_noise);
G_noise_Gau =  uint8((255/max(max(G_noise_Gau)))*G_noise_Gau);

SP_noise_Box = convolve(Box_filter,SP_noise);
SP_noise_Box =  uint8(SP_noise_Box*(255/max(max(SP_noise_Box))));
G_noise_Box = convolve(Box_filter,G_noise);
G_noise_Box =  uint8(G_noise_Box*(255/max(max(G_noise_Box))));

SP_noise_Med = uint8(simpleMedian(15,15,SP_noise));
G_noise_Med = uint8(simpleMedian(15,15,G_noise));

figure
t = tiledlayout(2,4);
nexttile
imshow(SP_noise)
title("S&P corrupted image")

nexttile
imshow(SP_noise_Gau)
title("Gaussian Filter on S&P noise")

nexttile
imshow(SP_noise_Box)
title("Box Filter on S&P noise")

nexttile
imshow(SP_noise_Med)
title("Median Filter on S&P noise")

nexttile
imshow(G_noise)
title("Gaussian corrupted image")

nexttile
imshow(G_noise_Gau)
title("Gaussian Filter on Gaussian noise")

nexttile
imshow(G_noise_Box)
title("Box Filter on Gaussian noise")

nexttile
imshow(G_noise_Med)
title("Median Filter on Gaussian noise")

t.Padding = 'compact';
t.TileSpacing = 'compact';


