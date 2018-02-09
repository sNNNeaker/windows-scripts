@echo off & setlocal ENABLEDELAYEDEXPANSION
set server=SERVERNAME
set countactive=0
set countDisconnected=0
for /f "tokens=1,2,3" %%k IN ('qwinsta /server:%server% ^| findstr "Aktiv"') DO @(
	set connection=%%k
	set user=%%l
	set id=%%m
	set /a countactive +=1
	echo User '!user!' ist noch aktiv !
)

for /f "tokens=1,2" %%k IN ('qwinsta /server:%server% ^| findstr "Getr\."') DO @(
	set /a countDisconnected +=1
	echo Trenne inaktive Verbindung von '%%k'.
	rwinsta %%l /server:!servername!
)

if !countactive! gtr 0 (
	echo Mindestens noch ein User aktiv. Neustart wird nicht durchgeführt
	goto :end
) else (
        echo Starte Shutdown des Servers ...
	shutdown.exe -s -t 5

)

:end
exit