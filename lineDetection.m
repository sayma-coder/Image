clear;
clc;

% Read the image
getim = imread('line3.jpg');
GI = rgb2gray(getim);

% Define masks for line detection
M1 = [-1 -1 -1; 2 2 2; -1 -1 -1]; %This mask detects vertical edges
M2 = [-1 -1 2; -1 2 -1; 2 -1 -1]; %This mask detects edges that are at a +45-degree angle
M3 = [-1 2 -1; -1 2 -1; -1 2 -1]; %it's rotated 90 degrees counterclockwise.
M4 = [2 -1 -1; -1 2 -1; -1 -1 2]; %-45-degree angle

% Apply convolution using built-in function conv2()
S1 = conv2(double(GI), M1, 'same');
S2 = conv2(double(GI), M2, 'same');
S3 = conv2(double(GI), M3, 'same');
S4 = conv2(double(GI), M4, 'same');

% Combine the results to find the strongest line responses
combined = max(max(S1, S2), max(S3, S4));

% Threshold the combined response
thresholded = (combined >= 250) * 255;

% Display the original and output images
subplot(2, 1, 1);
imshow(GI);
title('Input image');

subplot(2, 1, 2);
imshow(thresholded);
title('Output image.');