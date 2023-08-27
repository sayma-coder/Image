NET.addAssembly('System.speech');
mySpeaker=System.Speech.Synthesis.SpeechSynthesizer;
mySpeaker.Rate=3;
mySpeaker.Volume=100;
Speak(mySpeaker, ' Pabna University of Science  and Technology');

recObj = audiorecorder;
disp('Start speaking.');
recordblocking(recObj, 5);
disp('End of Recording.');
play(recObj);
y = getaudiodata(recObj);
plot(y);
