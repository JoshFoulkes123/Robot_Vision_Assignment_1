clear all
close all
dice1 = imread("dice1.jpg");
dice2 = imread("dice2.jpg");
dice3 = imread("dice3.jpg");
dice4 = imread("dice4.jpg");
% show_image(dice1)


dice1_bw = rgb2gray(dice1);
dice2_bw = rgb2gray(dice2);
dice3_bw = rgb2gray(dice3);
dice4_bw = rgb2gray(dice4);

%=======================================================

dice1_bw = conv2(fspecial("gaussian",7,2),dice1_bw);

radrange = [4,40];
%4-17
[a,b,c] = CircularHough_Grd(dice1_bw,radrange,3);
% ,5,10
%1,5
figure
hold on
imshow(dice1)
n = size(b,1);
out = ['number of circles: ',num2str(n)];
disp(out)
for i = 1:n
    drawcircle("Center",b(i,:),'Radius',c(i));
end

%=======================================================

dice2_bw = conv2(fspecial("gaussian",7,2),dice2_bw);

radrange = [12,20];
%4-17
[a,b,c] = CircularHough_Grd(dice2_bw,radrange,3,3);
% ,5,10
%1,5
figure
hold on
imshow(dice2)
n = size(b,1);
out = ['number of circles: ',num2str(n)];
disp(out)
for i = 1:n
    drawcircle("Center",b(i,:),'Radius',c(i));
end

%=======================================================


radrange = [9,30];
%4-17
[a,b,c] = CircularHough_Grd(dice3_bw,radrange,2,5);
% ,5,10
%1,5
figure
hold on
imshow(dice3)
n = size(b,1);
out = ['number of circles: ',num2str(n)];
disp(out)
for i = 1:n
    drawcircle("Center",b(i,:),'Radius',c(i));
end

%=======================================================


radrange = [1,20];
%4-17
[a,b,c] = CircularHough_Grd(dice4_bw,radrange,3);
% ,5,10
%1,5
figure
hold on
imshow(dice4)
n = size(b,1);
out = ['number of circles: ',num2str(n)];
disp(out)
for i = 1:n
    drawcircle("Center",b(i,:),'Radius',c(i));
end
