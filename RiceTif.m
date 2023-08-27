riceImage = imread('D:\Study_Object\3_2_Course\image processing\ICE_3208\problem2\ayTdk.jpg');

binaryImage = imbinarize(riceImage, graythresh(riceImage)); %graythresh separate dark and light part
cleanedImage = bwareaopen(imopen(binaryImage, strel('disk', 2)), 100); %objects smaller than 100 pixels will be removed

stats = regionprops(cleanedImage, 'Area', 'MajorAxisLength', 'Perimeter');

fprintf('Number of rice grains: %d\n', numel(stats));
fprintf('Rice grain measurements:\n');
fprintf('Grain #\tArea\tMajor Axis Length\tPerimeter\n');
for i = 1:numel(stats)
    fprintf('%d\t%.2f\t\t%.2f\t\t%.2f\n', i, stats(i).Area, stats(i).MajorAxisLength, stats(i).Perimeter);
end

imshow(label2rgb(bwlabel(cleanedImage)));
title('Rice Grains');