@echo off
echo Unregister right click menu for .wav files.
regedit /S "%~dp0scripts\RightClickMenuUnregister.reg"
echo Done.
IF %0 == "%~0" (
echo Press any key to exit...
pause >nul
)

