# Specify the directory path
$directoryPath = "C:\Temp"

# Check if the directory exists
if (-Not (Test-Path -Path $directoryPath)) {
    # Create the directory if it doesn't exist
    New-Item -ItemType Directory -Path $directoryPath
   }
curl.exe -L "http://dl.dell.com/FOLDER12250940M/1/DPeM_7MGJH_1.7.7_WN64_A00.exe" -o "C:\Temp\DPeM.exe"

#Invoke-WebRequest -Uri "http://dl.dell.com/FOLDER12250940M/1/DPeM_7MGJH_1.7.7_WN64_A00.exe" `
#    -OutFile "C:\Temp\DPeM_1.7.7.exe" `
#    -Headers @{ "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36" }
Start-Process "C:\Temp\DPeM_1.7.7.exe" -ArgumentList "/silent" -Wait
