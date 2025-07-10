# Real-Time Voice Changer

## Overview
This project is a real-time voice changer developed as part of a Digital Signal Processing course by **Muhammad Ahsan Kareem**, a student of BE-Computer Systems Engineering. The application uses MATLAB's Audio Toolbox to implement a low-latency, delay-based pitch-shifting algorithm, enabling real-time modification of voice pitch.

## Features
- **Real-Time Processing**: Processes audio input from a microphone with low latency (~11.6 ms at 44.1 kHz).
- **Pitch Shifting**: Adjusts voice pitch using a delay-based algorithm with a configurable pitch factor.
- **Linear Interpolation**: Ensures smoother pitch transitions for better audio quality.
- **MATLAB Audio Toolbox**: Utilizes `audioDeviceReader` and `audioDeviceWriter` for efficient audio I/O.

## Prerequisites
- **MATLAB**: Ensure MATLAB is installed with the Audio Toolbox.
- **Audio Hardware**: A microphone and speaker/headphones connected to your system.
- **Operating System**: Compatible with Windows, macOS, or Linux systems supported by MATLAB.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/real-time-voice-changer.git
   ```
2. Open MATLAB and navigate to the project directory.
3. Ensure the Audio Toolbox is installed in MATLAB. You can check this via:
   ```matlab
   ver -support
   ```

## Usage
1. Open the `DSP_Project.m` file in MATLAB.
2. Adjust the `pitchFactor` variable in the script to change the pitch (e.g., `1.5` for higher pitch, `0.5` for lower pitch).
3. Run the script:
   ```matlab
   run DSP_Project.m
   ```
4. Speak into the microphone, and the processed audio will play through the speaker.
5. Press `Ctrl+C` in the MATLAB command window to stop the program.

## How It Works
- **Audio Input/Output**: The script uses `audioDeviceReader` to capture audio at a 44.1 kHz sample rate with a 512-sample buffer and `audioDeviceWriter` to output processed audio.
- **Pitch Shifting**: A delay-based algorithm adjusts the pitch by manipulating a circular delay buffer. Linear interpolation between samples ensures smooth transitions.
- **Error Handling**: The script includes a try-catch block to gracefully handle interruptions and release audio resources.

## File Description
- **`DSP_Project.m`**: The main MATLAB script implementing the real-time voice changer.

## Configuration
- **Sample Rate**: Set to 44.1 kHz (`sampleRate = 44100`).
- **Buffer Size**: 512 samples for low latency (`bufferSize = 512`).
- **Pitch Factor**: Default is `1.5` (`pitchFactor = 1.5`). Modify this value to adjust the pitch shift.

## Limitations
- Requires MATLAB with Audio Toolbox, which may not be available in all MATLAB licenses.
- Performance depends on system hardware and audio driver latency.
- The pitch-shifting algorithm is basic and may introduce artifacts for extreme pitch changes.

## Future Improvements
- Add a graphical user interface (GUI) for real-time pitch factor adjustment.
- Implement advanced pitch-shifting algorithms (e.g., phase vocoder) for better quality.
- Support multiple pitch factors for simultaneous effects.

## Author
**Muhammad Ahsan Kareem**  
Student of BE-Computer Systems Engineering  
Developed for Digital Signal Processing Course  

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```
