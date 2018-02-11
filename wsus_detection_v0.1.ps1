##############################################
#
#			WSUS Detection Script
#
#			Author: pscholz@geuder.de
#
#			Version 0.1
#
##############################################
#
#			Version History
#
#			2017-11-22: Creation
#
##############################################

### Set Values ###
# Reg-Path for WU Policies
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
# Reg-Name for WU Server
$WUServer = "WUServer"
# Reg-Name for WU Status Server
$WUStatusServer = "WUStatusServer"
# Reg-Value for WU Server
$local_value = "http://<server>:8530"
# Reg-Value for Remote WU Server
$remote_value = "https://<server>"
# Current DNS Search Suffix
$CurrentDomain = gwmi Win32_NetworkAdapterConfiguration -filter "IPEnabled = '$True'" | foreach {$_.DNSDomain}
# Local DNS Search Suffix
$target = "geuder.local"
# Current WSUS Server
$OldWUServer = Get-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name "WUServer"

Write-Host "Current Domain is:"$CurrentDomain
Write-Host "Local Domain is:"$target

if ($CurrentDomain -contains $target) {
	### Execute Local ###
	Remove-ItemProperty -Path $registryPath -Name $WUServer
	Remove-ItemProperty -Path $registryPath -Name $WUStatusServer
	New-ItemProperty -Path $registryPath -Name $WUServer -Value $local_value
	New-ItemProperty -Path $registryPath -Name $WUStatusServer -Value $local_value
	}
Else {
	### Execute Remote ###
	Remove-ItemProperty -Path $registryPath -Name $WUServer
	Remove-ItemProperty -Path $registryPath -Name $WUStatusServer
	New-ItemProperty -Path $registryPath -Name $WUServer -Value $remote_value
	New-ItemProperty -Path $registryPath -Name $WUStatusServer -Value $remote_value
	}

$NewWUServer = Get-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name "WUServer"
Write-Host "Old WSUS Server was set to:"$OldWUServer
Write-Host "New WSUS Server is set to:"$NewWUServer
