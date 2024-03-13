@echo off
setlocal

set "password="

for /f "delims=" %%i in ('powershell -command "$password = Read-Host 'Enter password' -AsSecureString; $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)"') do set "password=%%i"

REM echo Your password is: %password%


