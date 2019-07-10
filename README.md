## Simple GUI and Packaging for TensorFlow Magenta Onsets and Frames Piano Transcription Tool

[Onsets and Frames][1] is a new machine learning model for automatic polyphonic
piano music transcription from [TensorFlow][2] [Magenta][3] research project.

Using this model, we can convert raw recordings of solo piano performances into
MIDI.

This is a simple GUI and packaging for Windows.

### How to use

1. Download and unpack [MagentaTranscribe.zip][4]
2. Convert audio to wav format
3. Close other apps to free memory, need at least 4G free memory
4. Run `Transcribe.bat` in `MagentaTranscribe` directory
5. Choose wav files, multiple selection is supported
6. Result MIDI files are in the same directory as the wav files

[1]: https://magenta.tensorflow.org/onsets-frames
[2]: https://www.tensorflow.org/
[3]: https://magenta.tensorflow.org/
[4]: https://github.com/azuwis/magenta_transcribe/releases/download/v0.1/MagentaTranscribe.zip
