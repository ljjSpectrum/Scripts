Invoke-WebRequest -Uri "https://dl.dell.com/FOLDER12250940M/1/DPeM_7MGJH_1.7.7_WN64_A00.exe" -OutFile "C:\Temp\dpminstaller.exe" 
Start-Process "C:\Temp\dpminstaller.exe" -ArgumentList "/silent" -Wait
