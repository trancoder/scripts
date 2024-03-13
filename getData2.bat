@echo off

REM Get today's date in YYYYMMDD format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set today=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%

REM SCP command to transfer files generated today
scp tran@192.168.1.220:~/research/*%today%* .

REM Optional: Add your password if you're not using SSH keys
REM scp -P your_ssh_port tran@192.168.1.220:~/research/*%today%* .

pause
