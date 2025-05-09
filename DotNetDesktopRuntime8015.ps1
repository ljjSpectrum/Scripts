# Define variables
$directoryPath = "C:\Temp"
$installerPath = "$directoryPath\windowsdesktop-runtime-8.0.15-win-x64.exe"
$downloadUrl = "https://aka.ms/dotnet/aspnetcore-runtime-8.0.15-win-x64.exe"


# Ensure directory exists
if (-not (Test-Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath | Out-Null
}

# Download the .NET runtime
Write-Host "Downloading .NET 8.0.15 Windows Desktop Runtime..."
curl.exe -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" `
    $downloadUrl `
    -o $installerPath

# Check if the file exists
if (Test-Path $installerPath) {
  
        Start-Process $installerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait
        Write-Host ".NET Desktop Runtime installation complete."
    } else {
    Write-Error "Download failed. File not found at expected location: $installerPath"
}
