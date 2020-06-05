## Simple GUI for Onsets and Frames Piano Transcription Tool

[Onsets and Frames][1] is a new machine learning model for automatic polyphonic
piano music transcription from [TensorFlow][2] [Magenta][3] research project.

Using this model, we can convert raw recordings of solo piano performances into
MIDI.

This is a simple GUI and packaging for Windows.

### Requirement

* OS: Windows 7 or later (64-bit)
* Memory: at least 8G

Only Windows 10 is tested.

TensorFlow works on Linux, mac OS, Windows, but only Windows package is provided
here.

If you use other OS, follow those [install][4] and [usage][5] guides instead.

### How to use

1. Download [Microsoft Visual C++ Redistributable for Visual Studio 2015, 2017 and 2019][6] `vc_redist_x64.exe` and install
2. Download and unpack [MagentaTranscribe.zip][7]
3. Convert audio to wav format
4. Close other apps to free memory, need at least 4G free memory
5. Run `MagentaTranscribe.exe` in `MagentaTranscribe` directory
6. Choose wav files, multiple selection is supported
7. Result MIDI files are in the same directory as the wav files

If you want right click menu for wav files, run `RightClickMenuRegister.bat`,
then you can right click a wav file, and choose `Magenta Transcribe`.

[1]: https://magenta.tensorflow.org/onsets-frames
[2]: https://www.tensorflow.org/
[3]: https://magenta.tensorflow.org/
[4]: https://www.tensorflow.org/install/pip
[5]: https://github.com/tensorflow/magenta/tree/master/magenta/models/onsets_frames_transcription
[6]: https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads
[7]: https://github.com/azuwis/magenta_transcribe/releases/download/v0.5/MagentaTranscribe-v0.5.zip

### Changelog

#### [0.5] - 2020-06-15

* Update magenta to 2.0.1
* Update python to 3.7.7.1
* Update pyinstaller to git HEAD

#### [0.4] - 2020-04-10

* Use pyinstaller to generate smaller package

#### [0.3] - 2020-04-02

* Update magenta to 1.3.0
* Update python to 3.7.7

#### [0.2] - 2019-07-11

* Support right click menu
* Powershell script to make package

#### [0.1] - 2019-07-10

* Initial release.
