# Specify the directory and installer file path
$directoryPath = "C:\Temp"
$installerFilePath = "C:\Temp\DPeM.exe"
$expectedHash = "587742fc6a0eaaaee03e7ea903e4dbb1"  # Expected MD5 hash for validation

# Create the directory if it doesn't exist
if (-Not (Test-Path -Path $directoryPath)) {
    New-Item -ItemType Directory -Path $directoryPath | Out-Null
}

# Download the Dell installer using curl with a browser-like User-Agent
Write-Host "Downloading Dell installer..."
curl.exe -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" `
    "https://dl.dell.com/FOLDER12250940M/1/DPeM_7MGJH_1.7.7_WN64_A00.exe" `
    -o $installerFilePath

# Check if the download was successful
if (Test-Path $installerFilePath) {
    Write-Host "Download complete. Verifying file hash..."

    # Verify the MD5 hash of the downloaded file
    $actualHash = (Get-FileHash -Path $installerFilePath -Algorithm MD5).Hash.ToLower()

    if ($actualHash -eq $expectedHash) {
        Write-Host "File hash is valid. Starting installation..."

        # Run the installer silently and wait for completion
        Start-Process $installerFilePath -ArgumentList "/silent" -Wait

        Write-Host "Installation complete."
    } else {
        Write-Error "File hash mismatch! The downloaded file may be corrupted. Aborting installation."
    }
} else {
    Write-Error "Installer file not found after download. Aborting installation."
}
