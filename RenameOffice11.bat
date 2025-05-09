@echo off
setlocal

REM Set the paths
set "source=C:\Program Files (x86)\Common Files\Microsoft Shared\Office11"
set "destination=C:\Program Files (x86)\Common Files\Microsoft Shared\Office11_remove"

REM Check if source exists
if exist "%source%" (
    echo Renaming folder...
    ren "%source%" "Office11_remove"
    if %errorlevel%==0 (
        echo Rename successful.
    ) 
)

endlocal
pause
