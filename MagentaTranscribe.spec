# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

from PyInstaller.utils.hooks import collect_data_files, copy_metadata
tf_datas = collect_data_files('tensorflow', includes=['lite/experimental/microfrontend/python/ops/_audio_microfrontend_op.so'])
tf_datas += collect_data_files('wcwidth')
tf_datas += copy_metadata('google-api-python-client')
tf_imports=['sklearn.utils._cython_blas', 'sklearn.neighbors.typedefs', 'sklearn.neighbors.quad_tree', 'sklearn.tree._utils', 'tensorflow.python.keras.engine.base_layer_v1', 'tensorflow.python.ops.while_v2']

a = Analysis(['MagentaTranscribe.py'],
             pathex=['build\\'],
             binaries=[],
             datas=tf_datas,
             hiddenimports=tf_imports,
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          [],
          exclude_binaries=True,
          name='MagentaTranscribe',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=False,
          console=True )
coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=False,
               upx_exclude=[],
               name='MagentaTranscribe')
