clear;
close all;

% Read the speech signal
[speechSignal, Fs] = audioread('D:\Study_Object\3_2_Course\image processing\ImageProcessingLab\New_Real_Conversation_Lessons.mp3');

% Parameters
frameSize = 0.02;
overlap = 0.5;
thresholdEnergy = 0.02;
thresholdZCR = 50;

frameLength = round(Fs * frameSize);
overlapLength = round(frameLength * overlap);

% Initialize arrays to store different regions
voicedRegions = zeros(size(speechSignal));
unvoicedRegions = zeros(size(speechSignal));
silenceRegions = zeros(size(speechSignal));

% Split the signal into frames and process each frame
for i = 1:frameLength-overlapLength:length(speechSignal)-frameLength+1
    frame = speechSignal(i:i+frameLength-1);
    
    energy = sum(frame.^2) / frameLength;
    zcr = sum(frame(1:end-1) .* frame(2:end) < 0) / frameLength;
    
    if energy < thresholdEnergy
        silenceRegions(i:i+frameLength-1) = frame;
    elseif zcr > thresholdZCR
        unvoicedRegions(i:i+frameLength-1) = frame;
    else
        voicedRegions(i:i+frameLength-1) = frame;
    end
end

% Plot the results
time = (0:length(speechSignal)-1) / Fs;
subplot(3,1,1), plot(time, voicedRegions), title('Voiced Regions')
subplot(3,1,2), plot(time, unvoicedRegions), title('Unvoiced Regions')
subplot(3,1,3), plot(time, silenceRegions), title('Silence Regions')
xlabel('Time (s)')

% Play the separated regions
soundsc(voicedRegions, Fs);
pause(length(voicedRegions) / Fs);
soundsc(unvoicedRegions, Fs);
pause(length(unvoicedRegions) / Fs);
soundsc(silenceRegions, Fs);