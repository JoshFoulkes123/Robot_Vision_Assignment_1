function [O] = Feature_extraction(I_set)

image_set = I_set;

prevPoints   = detectSURFFeatures(image_set{1}, 'NumOctaves', 8);
out_points{1} = prevPoints;
prevFeatures = extractFeatures(image_set{1}, prevPoints, 'Upright', true);

% figure
% imshow(image_set{1});
% points = prevPoints.Location';
% axis on;
% hold on;
% plot(points(1,:),points(2,:),'r.')

for i = 2:numel(image_set)
    I = imresize(image_set{i},2^(i-1));
    currPoints   = detectSURFFeatures(I, 'NumOctaves', 8);
    currFeatures = extractFeatures(I, currPoints, 'Upright', true);    
    indexPairs   = matchFeatures(prevFeatures, currFeatures, ...
        'MaxRatio', .7, 'Unique',  true);
    
    matchedPoints1 = prevPoints(indexPairs(:, 1));
    matchedPoints2 = currPoints(indexPairs(:, 2));
    out_points{i} = matchedPoints2;
    
%     figure
%     imshow(I);
%     points = matchedPoints2.Location';
%     axis on;
%     hold on;
%     plot(points(1,:),points(2,:),'r.');


    prevFeatures = currFeatures;
    prevPoints   = currPoints;

end

O = out_points;

