ECHO ::: Installation Cubeware Voraussetzungen ::: >> C:\C8InstallLog.txt
\\server10.geuder.local\softwareverteilung\Cubeware\C8Cockpit_ClientRollOut\SQLSERVER2008_ASOLEDB10_x86.msi /norestart /qn >> C:\C8InstallLog.txt
ECHO ::: Installation Cubeware Cockpit C8 ::: >> C:\C8InstallLog.txt
ECHO ::: C8 Connect Basis ::: >> C:\C8InstallLog.txt
\\server10.geuder.local\softwareverteilung\Cubeware\C8Cockpit_ClientRollOut\1_C8_Connect_Basis.exe /S /v"/qn ALLUSERS=2" >> C:\C8InstallLog.txt
ECHO ::: C8 Connect Hotfix ::: >> C:\C8InstallLog.txt
\\server10.geuder.local\softwareverteilung\Cubeware\C8Cockpit_ClientRollOut\2_C8_Connect_HotFix1.exe /S /v"/qn ALLUSERS=2" >> C:\C8InstallLog.txt
ECHO ::: C8 Cockpit Basis ::: >> C:\C8InstallLog.txt
\\server10.geuder.local\softwareverteilung\Cubeware\C8Cockpit_ClientRollOut\3_C8_Cockpit_Basis.exe /S /L1031 /v"/qn ALLUSERS=2 INSTALLDIR=\"C:\Program Files (x86)\Cubeware\C8 Cockpit\" COMPANYNAME=\"Geuder AG\"" >> C:\C8InstallLog.txt
ECHO ::: C8 Cockpit Hotfix ::: >> C:\C8InstallLog.txt
\\server10.geuder.local\softwareverteilung\Cubeware\C8Cockpit_ClientRollOut\4_C8_Cockpit_Hotfix1.exe /S /L1031 /v"/qn ALLUSERS=2 INSTALLDIR=\"C:\Program Files (x86)\Cubeware\C8 Cockpit\" COMPANYNAME=\"Geuder AG\"" >> C:\C8InstallLog.txt
ECHO ::: Installation durchgeführt ::: >> C:\C8InstallLog.txt