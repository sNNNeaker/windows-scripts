### Uninstall Trendmicro
@ECHO OFF
IF EXIST "C:\tm_uninstalled.txt" GOTO EXIT

\\<tm-server>\trend\Autopcc.exe :LOOP
ping -n 60 127.0.0.1 > NUL
IF EXIST "%ProgramFiles%\Trend Micro\OfficeScan Client" GOTO LOOP
ECHO "uninstalled" > "C:\tm_uninstalled.txt"

:EXIT
