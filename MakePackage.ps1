function MakeDir {
    param($Dir)
    if (-not (Test-Path $Dir)) {
        mkdir -Path $Dir | Out-Null
    }
}

function Registry {
    param($Path,$Name,$Value,$Type)
    $Json = (ConvertTo-Json $Value)
    $command = ""
    if (-not (Test-Path $Path)) {
        $command = "New-Item `"$Path`" -Force | New-ItemProperty -Name `"$Name`" -PropertyType $Type -Force -Value "
    } elseif (-not ((ConvertTo-Json (Get-ItemProperty $Path | Select-Object -ExpandProperty $Name -ErrorAction Ignore)) -eq $Json)) {
        $command = "Set-ItemProperty `"$Path`" -Name `"$Name`" -Type $Type -Force -Value "
    }
    if (-not ($command -eq "")) {
        Write-Host "Registry: $Path!$Name -> $Value"
        if ($Type -eq "String") {
            $command += "`"$Value`""
        } else {
            $command += "(ConvertFrom-Json `"$Json`")"
        }
        RunAsAdmin $command
    }
}

function RunAsAdmin {
    param($Command)
    $bytes = [System.Text.Encoding]::Unicode.GetBytes($Command)
    $encodedCommand = [Convert]::ToBase64String($bytes)
    Start-Process powershell -Verb runAs -ArgumentList "-EncodedCommand $encodedCommand"
}

function UnpackUrl {
    param($Url,$File,$UnpackDir,$TestPath)
    if (-not $File) {
        $File = $Url.Substring($Url.LastIndexOf("/") + 1)
        $Output = "dist\downloads\$File"
    }
    if (-not $TestPath) {
        $TestPath = $UnpackDir
    }
    if (-not (Test-Path "$TestPath")) {
        Write-Host "UnpackUrl: $Url -> $UnpackDir"
        if (-not (Test-Path $Output)) {
            Import-Module BitsTransfer
            Start-BitsTransfer -Description "Downloading $File from $Url" -Source $Url -Destination $Output
        }
        switch ((Get-Item $Output).Extension) {
            '.zip' {
                $shell = New-Object -com shell.application
                $shell.Namespace([IO.Path]::Combine($pwd, $UnpackDir)).CopyHere($shell.Namespace([IO.Path]::Combine($pwd, $Output)).Items())
            }
            '.exe' {
                Start-Process $output -Wait -ArgumentList "-y -o$UnpackDir"
            }
        }
    }
}

# disable bits branchcache https://powershell.org/forums/topic/bits-transfer-with-github/
Registry -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\BITS -Name DisableBranchCache -Value 1 -Type DWord

MakeDir build\
MakeDir dist\downloads\

UnpackUrl -Url https://github.com/winpython/winpython/releases/download/2.3.20200530/Winpython64-3.7.7.1dot.exe `
    -UnpackDir build\ -TestPath build\python\
if (-not (Test-Path build\python\)) {
    mv build\WPy64-3771\ build\python\
}

$Python="build\python\scripts\python.bat"
$ScriptsDir="build\python\python-3.7.7.amd64\Scripts"

if (-not (Test-Path $ScriptsDir\onsets_frames_transcription_transcribe.exe)) {
    & $Python -m pip install magenta
}

#$FixFile="$ScriptsDir\..\Lib\site-packages\tensorflow_core\_api\v1\compat\v2\summary\__init__.py"
#if (-not (Test-Path "${FixFile}.orig")) {
#    cp $Fixfile "${Fixfile}.orig"
#    Get-Content "${FixFile}.orig" | Select-String -pattern "experimental" -notmatch | Out-File -encoding UTF8 $FixFile
#}

if (-not (Test-Path $ScriptsDir\pyinstaller.exe)) {
    & $Python -m pip install https://github.com/pyinstaller/pyinstaller/tarball/develop
}

& $Python -m pip freeze | Out-File -encoding UTF8 pip.txt

#UnpackUrl -Url https://github.com/upx/upx/releases/download/v3.96/upx-3.96-win64.zip `
#    -UnpackDir build -TestPath build\upx\
#if (-not (Test-Path build\upx\)) {
#    mv build\upx-3.96-win64\ build\upx\
#}
#--upx-dir build\upx `
#--upx-exclude vcruntime140.dll `
#--upx-exclude msvcp140.dll `

if (-not (Test-Path build\dist\MagentaTranscribe\)) {
    cp MagentaTranscribe.py, MagentaTranscribe.spec build\
    & $Python $ScriptsDir\pyinstaller.exe `
    --noconfirm `
    --distpath build\dist\ `
    --workpath build\build\ `
    --specpath build\ `
    build\MagentaTranscribe.spec
}

UnpackUrl -Url https://storage.googleapis.com/magentadata/models/onsets_frames_transcription/maestro_checkpoint.zip `
    -UnpackDir build\dist\MagentaTranscribe\ -TestPath build\dist\MagentaTranscribe\train\

MakeDir build\dist\MagentaTranscribe\sox\
UnpackUrl -Url https://cfhcable.dl.sourceforge.net/project/sox/sox/14.4.2/sox-14.4.2-win32.zip `
    -UnpackDir build\ -TestPath build\dist\MagentaTranscribe\sox\sox.exe
if (Test-Path build\sox-14.4.2\) {
    mv build\sox-14.4.2\*.exe, build\sox-14.4.2\*.dll build\dist\MagentaTranscribe\sox\
    rm -r build\sox-14.4.2\
}

MakeDir build\dist\MagentaTranscribe\reg\
cp README.md build\dist\MagentaTranscribe\README.txt
cp RightClickMenuRegister.bat, RightClickMenuUnregister.bat build\dist\MagentaTranscribe\
cp RightClickMenuRegister.reg.in, RightClickMenuUnregister.reg build\dist\MagentaTranscribe\reg\

if (-not (Test-Path dist\MagentaTranscribe.zip)) {
    Add-Type -assembly "system.io.compression.filesystem"
    [IO.Compression.ZipFile]::CreateFromDirectory([IO.Path]::Combine($pwd, "build\dist\"), [IO.Path]::Combine($pwd, "dist\MagentaTranscribe.zip"))
}

Write-Host
Read-Host "Done, press enter to exit"
