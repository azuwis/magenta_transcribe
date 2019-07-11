@echo off
echo Register right click menu for .wav files.
set dir=%~dp0
for /f "delims=" %%i in ('type "scripts\RightClickMenuRegister.reg.in" ^& break ^> "scripts\RightClickMenuRegister.reg" ') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    >>"scripts\RightClickMenuRegister.reg" echo(!line:@REPLACE@=%dir:\=\\%!
    endlocal
)
regedit /S "%~dp0scripts\RightClickMenuRegister.reg"
echo Done.
IF %0 == "%~0" (
echo Press any key to exit...
pause >nul
)

