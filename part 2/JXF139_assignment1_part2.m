clear all
close all

%%%%%load images
Blue = imread("Blue_Marble.jpg");
chicago = imread("Chicago_Downtown_Aerial_View.jpg");
Malards = imread("Malards_in_Golden_Gate_Park.jpg");

%%%%%%turn images black and white
Blue_bw = rgb2gray(Blue);
chicago_bw = rgb2gray(chicago);
Malards_bw = rgb2gray(Malards);

%%%%%apply dog, the effect of this is used in Pyramid
Blue_dog = DOG(Blue_bw,15);
chicago_dog = DOG(chicago_bw,15);
Malards_dog = DOG(Malards_bw,15);
%%%%%%display DoG outcomes
figure
imshow(Blue_dog)
figure
imshow(chicago_dog)
figure
imshow(Malards_dog)

%%%%%%create scale pyramids of 5 images using a 15x15 DoG filter
[Blue_pyr, Blue_pyr_P] = Pyramid(Blue_bw,15,5);
[chicago_pyr, chicago_pyr_P] = Pyramid(chicago_bw,15,5); 
[Malards_pyr, Malards_pyr_P] = Pyramid(Malards_bw,15,5);
%%%%%%display pyramids
figure
imshow(Blue_pyr_P)
figure
imshow(chicago_pyr_P)
figure
imshow(Malards_pyr_P)

%%%%%extract features from pyramid and display
%%%%Marble
O = Feature_extraction(Blue_pyr);
figure
axis on;
hold on;
imshow(Blue);
points = O{end}.Location;
scales = O{end}.Scale;
n = size(scales,1);
%top 20 for speed
for i = 1:20
    drawcircle("Center",points(i,:),'Radius',scales(i));
end
hold off
%%%%Chicago
O = Feature_extraction(chicago_pyr);
figure
axis on;
hold on;
imshow(chicago);
points = O{end}.Location;
scales = O{end}.Scale;
n = size(scales,1);
%top 20 for speed
for i = 1:20
    drawcircle("Center",points(i,:),'Radius',scales(i));
end
hold off
%%%%%%Malards
O = Feature_extraction(Malards_pyr);
figure
axis on;
hold on;
imshow(Malards);
points = O{end}.Location;
scales = O{end}.Scale;
n = size(scales,1);
%top 20 for speed
for i = 1:20
    drawcircle("Center",points(i,:),'Radius',scales(i));
end
hold off


%%%%%%%%detect features and display them iwth there scale and position
%%%%%Blue
I = Blue_bw;
points = detectSURFFeatures(I);
[features, valid_points] = extractFeatures(I,points);
figure
imshow(I); 
hold on;
strongestPoints = valid_points.selectStrongest(20);
strongestPoints.plot('showOrientation',true,'ShowScale',true);
%%%%%%Chicago
I = chicago_bw;
points = detectSURFFeatures(I);
[features, valid_points] = extractFeatures(I,points);
figure
imshow(I); 
hold on;
strongestPoints = valid_points.selectStrongest(20);
strongestPoints.plot('showOrientation',true,'ShowScale',true);
%%%%%%%Malards
I = Malards_bw;
points = detectSURFFeatures(I);
[features, valid_points] = extractFeatures(I,points);
figure
imshow(I); 
hold on;
strongestPoints = valid_points.selectStrongest(20);
strongestPoints.plot('showOrientation',true,'ShowScale',true);
