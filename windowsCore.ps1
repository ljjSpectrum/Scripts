# PowerShell script to run winget upgrade --all
Start-Process -FilePath "C:\Users\CFU\AppData\Local\Microsoft\WindowsApps\winget.exe" -ArgumentList "upgrade --all --silent --accept-package-agreements --accept-source-agreements --include-unknown" -Verb RunAs -Wait
