@echo off
regedit /S "%~dp0scripts\RightClickMenuUnregister.reg"
IF %0 == "%~0" (
echo Done.
echo Press any key to exit...
pause >nul
)

