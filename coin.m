clear;
coinImage = imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\problem8\1.png');
 
binaryImage = imbinarize(coinImage);
binaryImage = bwareaopen(imopen(binaryImage, strel('arbitrary', 1)), 120);
 
stats = regionprops('table', binaryImage, 'Area');
numCoin = height(stats);
areas = stats.Area;
 
fprintf('Number of Coin grains: %d\n', numCoin);
fprintf('Coin Area measurements:\n');
fprintf('Grain \tArea\n');
fprintf('%d\t\t%.2f\n', [1:numCoin; areas']');
 
RGB = label2rgb(labelmatrix(bwconncomp(binaryImage)), 'parula', 'k', 'shuffle');
imshow(RGB);
title('Coin Grains');
