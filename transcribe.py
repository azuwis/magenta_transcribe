#!/usr/bin/python

import os, sys

if __name__ == '__main__':
    have_args = len(sys.argv) > 1

    argv = tuple(sys.argv)
    argv = (argv[0],) + ('--hparams=use_cudnn=false',) + argv[1:]

    if not have_args:
        import tkinter as tk
        from tkinter import filedialog
        root = tk.Tk()
        root.withdraw()
        files = filedialog.askopenfilenames(filetypes = [('wav files', '*.wav *.wave')])
        argv = argv + root.tk.splitlist(files)

    if have_args or files:
        import tensorflow.compat.v1 as tf
        from magenta.models.onsets_frames_transcription.onsets_frames_transcription_transcribe import main, FLAGS

        model_dir = os.path.join(os.path.dirname(__file__), '../../../train')
        FLAGS.model_dir = model_dir

        tf.app.run(main = main, argv = argv)
