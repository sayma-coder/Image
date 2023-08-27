
%Display following image operation in MATLAB/Python - i) Threshold image ii) Power 
%enhance contract image iii) High pass image.

% Load the image
inputImage = imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\problem3\4.jpeg');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Thresholding
thresholdValue = 128;
binaryImage = grayImage > thresholdValue;

% Display the thresholded image
subplot(311);
imshow(binaryImage);
title('Threshold Image');



% Load the image

inputImage = imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\problem3\4.jpeg');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Power-law transformation
gamma = 1.5;
c = 1;
enhancedImage = c * (double(grayImage) .^ gamma);
enhancedImage = uint8(255 * (enhancedImage / 255).^ (1/gamma));

% Display the enhanced contrast image
subplot(312);
imshow(enhancedImage);
title('Power Enhanced Contrast Image');


% Load the image
inputImage = imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\problem3\4.jpeg');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Create a high-pass filter kernel (Laplacian)
laplacianKernel = [0 -1 0; -1 4 -1; 0 -1 0];

% Apply the high-pass filter using convolution
highPassImage = conv2(double(grayImage), laplacianKernel, 'same');
highPassImage = uint8(highPassImage);

% Display the high-pass image
subplot(313);
imshow(highPassImage);
title('High Pass Image');