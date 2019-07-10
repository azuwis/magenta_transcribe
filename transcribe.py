#!/usr/bin/python

import os, sys
import tkinter as tk
from tkinter import filedialog

if __name__ == '__main__':
    root = tk.Tk()
    root.withdraw()

    files = filedialog.askopenfilenames(filetypes = [('wav files', '*.wav *.wave')])
    if files:
        import tensorflow.compat.v1 as tf
        from magenta.models.onsets_frames_transcription.onsets_frames_transcription_transcribe import main, FLAGS

        model_dir = os.path.join(os.path.dirname(__file__), '../../train')
        FLAGS.model_dir = model_dir

        tf.app.run(main = main, argv = (sys.argv[0],) + root.tk.splitlist(files))
