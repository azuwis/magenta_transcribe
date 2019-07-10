@echo off
call "%~dp0scripts\env.bat"
"%WINPYDIR%\python.exe" "%WINPYDIR%\Scripts\transcribe.py" %*
echo.
echo Done.
echo Press any key to exit...
pause >nul

