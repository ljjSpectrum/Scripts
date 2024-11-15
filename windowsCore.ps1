# PowerShell script to run winget upgrade --all
Start-Process -FilePath "winget" -ArgumentList "upgrade --all" -Verb RunAs -Wait

