@echo off
echo ################################################################
echo ################################################################
echo # Es wird überprüft ob Microsoft Office 2013 
echo # bereits installiert ist. 
echo ################################################################

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Office15.PROPLUS /v UninstallString
IF %errorlevel%==1 GOTO REGX64CHECK
goto END

:REGX64CHECK
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Office15.PROPLUS /v UninstallString
IF %errorlevel%==1 GOTO INSTALL
goto END

:INSTALL
echo ################################################################
echo ################################################################
echo # Microsoft Office 2000 wird deinstalliert. 
echo ################################################################
if not exist "C:\Office-2000-Deinstallation" mkdir "C:\Office-2000-Deinstallation"
robocopy "\\192.168.4.10\Softwareverteilung\Office 2000" "C:\Office-2000-Deinstallation" /COPY:DAT /E /V /R:2 /W:3 /TEE /LOG:%userprofile%\Office-2000-Log-Transfer.log
msiexec.exe /x C:\Office-2000-Deinstallation\data1.msi /qn /norestart /l*v %userprofile%\Office-2000-Deinstallation.log
echo ################################################################
echo ################################################################
echo # Microsoft Office 2000 wurde deinstalliert. 
echo ################################################################
timeout /t 4 /nobreak
echo ################################################################
echo ################################################################
echo # Microsoft Office 2000 wurde deinstalliert. 
echo ################################################################
timeout /t 4 /nobreak
echo ################################################################
echo ################################################################
echo # Microsoft Office 2013 Installationsverzeichnis 
echo # wird heruntergeladen. 
echo ################################################################
timeout /t 4 /nobreak
if not exist "C:\Office-Installation" mkdir "C:\Office-Installation"
robocopy "\\192.168.4.10\Softwareverteilung\Office 2013\x86" "C:\Office-Installation" /COPY:DAT /E /V /R:2 /W:3 /TEE /LOG:%userprofile%\Office-2013-Log-Transfer.log
echo ################################################################
echo ################################################################
echo # Microsoft Office 2013 Installationsverzeichnis heruntergeladen.
echo # Die Installation beginnt in wenigen Sekunden.
echo ################################################################
timeout /t 6 /nobreak
"C:\Office-Installation\setup.exe" /adminfile "C:\Office-Installation\geuder_office_2013_x86.msp"
echo ################################################################
echo ################################################################
echo # Microsoft Office 2013 wurde erfolgreich installiert.
echo # Die Aktivierung wird nun ausgefuehrt.
echo ################################################################
timeout /t 6 /nobreak
cscript.exe //nologo "%ProgramFiles(x86)%\Microsoft Office\Office15\OSPP.VBS" /act
IF %ERRORLEVEL% NEQ 1 (
cscript.exe //nologo "%ProgramFiles%\Microsoft Office\Office15\OSPP.VBS" /act)
IF %ERRORLEVEL% NEQ 1 (
cscript.exe //nologo "%ProgramFiles(x86)%\Microsoft Office 2007\Office15\OSPP.VBS" /act)
IF %ERRORLEVEL% NEQ 1 (
cscript.exe //nologo "%ProgramFiles%\Microsoft Office 2007\Office15\OSPP.VBS" /act)
IF %ERRORLEVEL% NEQ 1 (
cscript.exe //nologo "%ProgramFiles%\Microsoft Office 2010\Office15\OSPP.VBS" /act)
IF %ERRORLEVEL% NEQ 1 (
cscript.exe //nologo "%ProgramFiles (x86)%\Microsoft Office 2010\Office15\OSPP.VBS" /act)
echo ################################################################
echo ################################################################
echo # Microsoft Office 2013 wurde erfolgreich aktiviert.
echo # Das Installationsverzeichnis wird nun geloescht.
echo ################################################################
timeout /t 6 /nobreak
DEL /S /F /Q "C:\Office-Installation"
RD /S /Q "C:\Office-Installation"
DEL /S /F /Q "C:\Office-2000-Deinstallation"
RD /S /Q "C:\Office-2000-Deinstallation"
echo ################################################################
echo ################################################################
echo # Microsoft Office 2013 Installationsverzeichnis wurde geloescht.
echo # Installation abgeschlossen.
echo ################################################################
cscript.exe "\\192.168.4.10\public\edv\office 2013 installation\message\Complete.vbs"
exit

:END
echo ################################################################
echo ################################################################
echo # Microsoft Office 2013 ist bereits installiert.
echo # Das Installations Programm wird beendet.
echo ################################################################
cscript.exe "\\192.168.4.10\public\edv\office 2013 installation\message\alreadyinstalled.vbs"
exit