# Set URL or network path to the .cab file
#$updateUrl = "https://github.com/ljjSpectrum/Scripts/blob/main/windows10.0-kb5059607-x64_e3d41d6b69501d1851fb1afd6562859151f539af.cab"
$updateUrl = "https://www.dropbox.com/scl/fi/1vw1shx9do8lvfvm9tfpm/KB0546400.ps1?rlkey=bb0lrormhxqcunndhsjuv60ru&st=mm7sv4jb&dl=1"
$localPath = "C:\TEMP2\KB5046400.cab"
$localDir = "C:\TEMP2"

# Ensure the directory exists
if (-not (Test-Path $localDir)) 
{
    New-Item -ItemType Directory -Path $localDir | Out-Null
}

# Download the file
Invoke-WebRequest -Uri $updateUrl -OutFile $localPath

# Install the update
Start-Process "dism.exe" -ArgumentList "/Online", "/Add-Package", "/PackagePath=$localPath", "/Quiet", "/NoRestart" -Wait

# Optionally clean up
Remove-Item $localPath -Force
