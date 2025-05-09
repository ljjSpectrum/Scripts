# Define variables
$directoryPath = "C:\Temp"
$installerPath = "$directoryPath\windowsdesktop-runtime-8.0.15-win-x64.exe"
$downloadUrl = "https://download.visualstudio.microsoft.com/download/pr/5946b535-19ab-4429-b0d1-82e2d0b5cbd4/34b97f657fa86c35478d29ed38500846/windowsdesktop-runtime-8.0.15-win-x64.exe"
$expectedHash = "44AE30E2F3C8C45DF28936A26D7D160E62B6315A0112B96C9BE2E4D7F15E482E".ToLower()

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
  #  Write-Host "Download complete. Verifying SHA256 hash..."

  #  $actualHash = (Get-FileHash -Path $installerPath -Algorithm SHA256).Hash.ToLower()

   # if ($actualHash -eq $expectedHash) {
   #     Write-Host "Hash verified successfully. Starting silent installation..."
        Start-Process $installerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait
        Write-Host ".NET Desktop Runtime installation complete."
    #} else {
    #    Write-Error "File hash mismatch! Expected $expectedHash but got $actualHash. Installation aborted."
    }
} else {
    Write-Error "Download failed. File not found at expected location: $installerPath"
}
