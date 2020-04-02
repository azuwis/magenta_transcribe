@echo off
echo Register right click menu for .wav files.
set dir=%~dp0
for /f "delims=" %%i in ('type "python\scripts\RightClickMenuRegister.reg.in" ^& break ^> "python\scripts\RightClickMenuRegister.reg" ') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    >>"python\scripts\RightClickMenuRegister.reg" echo(!line:@REPLACE@=%dir:\=\\%!
    endlocal
)
regedit /S "%~dp0python\scripts\RightClickMenuRegister.reg"
echo Done.
IF %0 == "%~0" (
echo Press any key to exit...
pause >nul
)

