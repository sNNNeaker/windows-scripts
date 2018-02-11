:INSTALL
echo :: Install Pre-Req .net 4.52
\\<SERVER>\SGN\NDP452-KB2901907-x86-x64-AllOS-ENU.exe /q /norestart /ChainingPackage FluoronGmbH
echo :: Install Pre-Req vcredist
\\<SERVER>\SGN\vcredist_x86.exe /passive /norestart
echo :: Install Pre-Req vcredist 14
\\<SERVER>\SGN\vcredist14_x86.exe /install /passive /norestart
echo :: Query 32/64 Bit
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT

:32BIT
echo :: Install x86 Pre-Req
\\Backup01.fluoron.local\SGN\SGxClientPreinstall_x86.msi
echo :: Install x86 Client
msiexec.exe /i "\\<SERVER>\SGN\sgncient_x86.msi" ADDLOCAL=Client,CredentialProvider,BaseEncryption,SectorBasedEncryption OPALMODDE=2 /L* c:\sgnclient_%computername%.txt /qn
GOTO END

:64BIT
echo :: Install x64 Pre-Req
\\<SERVER>\SGN\SGxClientPreinstall_x64.msi
echo :: Install x64 Client
msiexec.exe /i "\\<SERVER>\SGN\sgncient_x64.msi" ADDLOCAL=Client,CredentialProvider,BaseEncryption,SectorBasedEncryption OPALMODDE=2 /L* c:\sgnclient_%computername%.txt /qn

:END
echo :: END....
EXIT
