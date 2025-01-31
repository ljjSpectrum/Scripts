# Specify the directory path
$directoryPath = "C:\Temp"

# Check if the directory exists
if (-Not (Test-Path -Path $directoryPath)) {
    # Create the directory if it doesn't exist
    New-Item -ItemType Directory -Path $directoryPath
   }

Invoke-WebRequest -Uri "https://curl.se/windows/dl-8.11.1_3/curl-8.11.1_3-win64-mingw.zip" `
    -OutFile "curl-8.11.1_3-win64-mingw.zip" `
    -Headers @{ "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36" }
Start-Process "C:\Temp\DPeM_1.7.7.exe" -ArgumentList "/silent" -Wait
