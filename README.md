## Simple GUI for Onsets and Frames Piano Transcription Tool

[Onsets and Frames][1] is a new machine learning model for automatic polyphonic
piano music transcription from [TensorFlow][2] [Magenta][3] research project.

Using this model, we can convert raw recordings of solo piano performances into
MIDI.

This is a simple GUI and packaging for Windows.

### Requirement

* OS: Windows 7 or later (64-bit)
* CPU: support [AVX instructions][4]
* Memory: at least 8G

Only Windows 10 is tested.

TensorFlow works on Linux, mac OS, Windows, but only Windows package is provided
here.

If you use other OS, follow those [install][5] and [usage][6] guides instead.

### How to use

1. If using Windows 7 or Windows 8, download [Microsoft Visual C++ Redistributable for Visual Studio 2017][7] `vc_redist_x64.exe` and install
2. Download and unpack [MagentaTranscribe.zip][8]
3. Convert audio to wav format
4. Close other apps to free memory, need at least 4G free memory
5. Run `Transcribe.bat` in `MagentaTranscribe` directory
6. Choose wav files, multiple selection is supported
7. Result MIDI files are in the same directory as the wav files

If you want right click menu for wav files, run `RightClickMenuRegister.bat`,
then you can right click a wav file, and choose `Magenta Transcribe`.

### FAQ

Q: Get the following error:
```
ImportError: DLL load failed: A dynamic link library (DLL) initialization routine failed.
```
A: Make sure the CPU support [AVX instructions][4], try another computer with newer CPU.

[1]: https://magenta.tensorflow.org/onsets-frames
[2]: https://www.tensorflow.org/
[3]: https://magenta.tensorflow.org/
[4]: https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#CPUs_with_AVX
[5]: https://www.tensorflow.org/install/pip
[6]: https://github.com/tensorflow/magenta/tree/master/magenta/models/onsets_frames_transcription
[7]: https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads
[8]: https://github.com/azuwis/magenta_transcribe/releases/download/v0.3/MagentaTranscribe-v0.3.zip
