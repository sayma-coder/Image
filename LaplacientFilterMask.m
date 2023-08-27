

% Read the image
image = imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\problem3\pexels-photo-1661179.jpeg');

% Convert to grayscale
grayImage = rgb2gray(image);

% Apply Laplacian filter using built-in function
filteredImage = imfilter(grayImage, fspecial('laplacian'));

% Display the original and filtered images
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 2, 2);
imshow(filteredImage, []);
title('Laplacian Filtered Image');


%no need this part
laplacianMask = [0, 1, 0;
                 1, -4, 1;
                 0, 1, 0];


