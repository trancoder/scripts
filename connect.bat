@echo off
setlocal enabledelayedexpansion

REM Prompt the user for password without showing characters
set /p "password=Enter " < nul

REM Store the password in a temporary file
echo !password! > temp.txt

REM Use PowerShell to securely read the password from the temporary file
for /f "usebackq delims=" %%I in (`powershell -Command "$password = Get-Content temp.txt | ConvertTo-SecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)"`) do set "password=%%I"

REM Delete the temporary file
del temp.txt

REM echo Your password is: !password!

REM SSH to the server using the obtained password
ssh tran@192.168.1.220

pause
