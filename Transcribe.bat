@echo off
call "%~dp0python\scripts\env.bat"
"%WINPYDIR%\python.exe" "%WINPYDIR%\Scripts\transcribe.py" %*
IF %0 == "%~0" (
echo.
echo Done.
echo Press any key to exit...
pause >nul
)

