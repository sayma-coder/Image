figure(1)
%---------------Histogram--------------------
clc;
clear all;
close all;
% Load an image
image = imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\histHighLow\fruit-2999796.jpg');

% Convert to grayscale if needed
gray_image = rgb2gray(image);
subplot(211);
imshow(gray_image);

% Display histogram
subplot(212);
imhist(gray_image);
title('Histogram of the Image');


%-----------------------High pass filter for image filtering.--------------------
figure(2)

clc;
clear all;
close all;
inim = imread('cameraman.tif');
subplot(2,1,1), 
imshow(inim), 
title('Input image');

mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];%Laplacian/high pass filter

outim = conv2(double(inim), mask, 'same');
hpassim = uint8(outim);

subplot(2,1,2), 
imshow(hpassim), 
title('High pass filtered image');

%----------------------------------Low pass filter for image filtering.-------------------

figure(3)
getim = imread('cameraman.tif');
% inim = rgb2gray(getim);
subplot(2, 1, 1); 
imshow(getim); 
title('Input image');

mask = fspecial('average', 3);  % Create a 3x3 averaging filter mask
outim = conv2(double(getim), mask, 'same');

lpassim = uint8(outim);
subplot(2, 1,2); 
imshow(lpassim);
title('Low pass filtered image');

