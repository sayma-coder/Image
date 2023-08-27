% Load the image
inputImage = imread('Untitled2.jpeg');

% Convert the image to grayscale if it's not already
grayImage = rgb2gray(inputImage);

% Display the original image
subplot(2, 3, 1);
imshow(grayImage);
title('Original Image');

% Image enhancement using histogram equalization
enhancedImage = histeq(grayImage);
subplot(2, 3, 2);
imshow(enhancedImage);
title('Enhanced Image (Histogram Equalization)');

% Smoothing using Gaussian filter
gaussianFilter = fspecial('gaussian', [5 5], 1);
smoothedImage = imfilter(grayImage, gaussianFilter, 'replicate');
subplot(2, 3, 3);
imshow(smoothedImage);
title('Smoothed Image (Gaussian Filter)');

% Sharpening using Laplacian filter
laplacianFilter = fspecial('laplacian', 0);
sharpenedImage = imfilter(grayImage, laplacianFilter, 'replicate');
subplot(2, 3, 4);
imshow(sharpenedImage);
title('Sharpened Image (Laplacian Filter)');


set(gcf, 'Position', get(0, 'Screensize'));