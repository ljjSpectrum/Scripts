# Define variables
$directoryPath = "C:\Temp"
$installerFileName = "aspnetcore-runtime-8.0.15-win-x64.exe"
$installerPath = Join-Path $directoryPath $installerFileName
$downloadUrl = "https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/8.0.15/aspnetcore-runtime-8.0.15-win-x64.exe"
$expectedHash = "e17e74f598030bc3a3f5c3cf8b6bb8f7873fe19a79deb70822dcc3aa7d5fff8d".ToLower()

# Ensure the directory exists
if (-not (Test-Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath | Out-Null
}

# Download the ASP.NET Core Runtime installer
Write-Host "Downloading ASP.NET Core Runtime 8.0.15..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

# Verify the SHA256 hash
#if (Test-Path $installerPath) {
#    Write-Host "Download complete. Verifying SHA256 hash..."
#    $actualHash = (Get-FileHash -Path $installerPath -Algorithm SHA256).Hash.ToLower()
#    if ($actualHash -eq $expectedHash) {
#        Write-Host "Hash verified successfully. Starting silent installation..."

        Start-Process $installerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait
        Write-Host "ASP.NET Core Runtime installation complete."
        
 #   } else {
 #       Write-Error "File hash mismatch! Expected $expectedHash but got $actualHash. Installation aborted."
    }
} else {
    Write-Error "Download failed. File not found at expected location: $installerPath"
}
