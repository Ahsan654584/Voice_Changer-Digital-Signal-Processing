% Real-time voice changer with pitch shifting
% Uses MATLAB Audio Toolbox for low-latency audio I/O
% Implements a simple delay-based pitch shifter

% Initialize audio input and output
sampleRate = 44100; % Standard audio sampling rate (Hz)
bufferSize = 512; % Small buffer for low latency (~11.6 ms at 44.1 kHz)
pitchFactor = 1.5; % Pitch shift factor (>1 for higher pitch, <1 for lower)

% Create audio device reader and writer
mic = audioDeviceReader('SampleRate', sampleRate, 'SamplesPerFrame', bufferSize);
speaker = audioDeviceWriter('SampleRate', sampleRate);

% Initialize variables for pitch shifting
delayBuffer = zeros(round(sampleRate * 0.1), 1); % 100 ms delay buffer
writePtr = 1; % Write pointer for delay buffer
readPtr = 1; % Read pointer for delay buffer
delayLength = bufferSize / pitchFactor; % Delay length for pitch shift

% Inform user
disp('Starting real-time voice changer. Press Ctrl+C to stop.');

% Main processing loop
try
    while true
        % Read audio buffer from microphone
        audioIn = mic();
        
        % Initialize output buffer
        audioOut = zeros(bufferSize, 1);
        
        % Process each sample for pitch shifting
        for i = 1:bufferSize
            % Write input to delay buffer
            delayBuffer(writePtr) = audioIn(i);
            
            % Read from delay buffer with interpolation
            readPtrInt = floor(readPtr);
            frac = readPtr - readPtrInt;
            readPtrNext = mod(readPtrInt, length(delayBuffer)) + 1;
            readPtrPrev = mod(readPtrInt - 1, length(delayBuffer)) + 1;
            
            % Linear interpolation for smoother pitch shifting
            audioOut(i) = (1 - frac) * delayBuffer(readPtrPrev) + frac * delayBuffer(readPtrNext);
            
            % Update pointers
            writePtr = mod(writePtr, length(delayBuffer)) + 1;
            readPtr = readPtr + 1/pitchFactor;
            if readPtr > length(delayBuffer)
                readPtr = readPtr - length(delayBuffer);
            end
        end
        
        % Play processed audio
        speaker(audioOut);
    end
catch err
    % Clean up on error or interruption
    release(mic);
    release(speaker);
    disp('Voice changer stopped.');
    rethrow(err);
end

% Clean up
release(mic);
release(speaker);