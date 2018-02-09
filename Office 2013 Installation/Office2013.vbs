set shell = WScript.CreateObject("WScript.Shell")
result = MsgBox ("Bitte schliessen Sie alle Microsoft Office Programme." & vbNewLine & "Ist der Laptop mit dem Strom verbunden?" & vbNewLine & "Haben Sie eine stabile Internetverbindung?" & vbNewLine & "Ist die VPN zur Geuder AG aktiv und laeuft nicht in unter 3 Stunden ab?" & vbNewLine & "Soll die Installation nun gestartet werden?", vbYesNo, "Geuder AG Microsoft Office 2013 Installation")

Select Case result
Case vbYes
    MsgBox("Mit dem Klick auf 'OK' werden die Installationsdateien von Microsoft Office 2013 heruntergeladen und anschliessend die Installation gestartet.")
	shell.run ".\Office-Installation.bat"
Case vbNo
    MsgBox("Installation wird nun beendet.")
End Select