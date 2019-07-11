## Simple GUI for Onsets and Frames Piano Transcription Tool

[Onsets and Frames][1] is a new machine learning model for automatic polyphonic
piano music transcription from [TensorFlow][2] [Magenta][3] research project.

Using this model, we can convert raw recordings of solo piano performances into
MIDI.

This is a simple GUI and packaging for Windows.

### Requirement

Windows 64bit with at least 8G memory, only Windows 10 is tested.

TensorFlow works on Linux, mac OS, Windows, but only Windows package is provided
here.

If you use other OS, follow those [install][5] and [usage][6] guides instead.

### How to use

1. Download and unpack [MagentaTranscribe.zip][4]
2. Convert audio to wav format
3. Close other apps to free memory, need at least 4G free memory
4. Run `Transcribe.bat` in `MagentaTranscribe` directory
5. Choose wav files, multiple selection is supported
6. Result MIDI files are in the same directory as the wav files

If you want right click menu for wav files, run `RightClickMenuRegister.bat`,
then you can right click a wav file, and choose `Magenta Transcribe`.

[1]: https://magenta.tensorflow.org/onsets-frames
[2]: https://www.tensorflow.org/
[3]: https://magenta.tensorflow.org/
[4]: https://github.com/azuwis/magenta_transcribe/releases/download/v0.2/MagentaTranscribe-v0.2.zip
[5]: https://www.tensorflow.org/install/pip
[6]: https://github.com/tensorflow/magenta/tree/master/magenta/models/onsets_frames_transcription
