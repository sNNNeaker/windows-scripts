echo ### abort and shutdown everything ##
shutdown.exe -a
for /f "tokens=2 delims==; " %%a in ('tasklist^| find "Geuder*" ') do set PID=%%a
taskkill /f /fi "WINDOWTITLE eq Geuder*"
taskkill /f /IM mshta.exe
taskkill /f /IM timeout.exe
shutdown.exe -a
taskkill /f /pid %PID%
taskkill /f /IM cmd.exe
exit