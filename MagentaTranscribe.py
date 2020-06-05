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
        script_dir = os.path.dirname(sys.argv[0])
        os.environ['PATH'] += os.pathsep + os.path.abspath(os.path.join(script_dir, 'sox'))

        from tensorflow.python.util import deprecation
        deprecation._PRINT_DEPRECATION_WARNINGS = False
        import logging
        logging.getLogger('tensorflow').propagate = False

        import tensorflow.compat.v1 as tf
        tf.logging.set_verbosity(tf.logging.ERROR)
        from magenta.models.onsets_frames_transcription.onsets_frames_transcription_transcribe import main, FLAGS

        model_dir = os.path.join(script_dir, 'train')
        FLAGS.model_dir = model_dir

        def app(argv):
            main(argv)
            input("\nPress Enter to exit...")

        tf.app.run(main = app, argv = argv)
