############################################################### 
# Copy_AD_OU_Structure_To_Another_Location_v1.0.ps1 
# Version 1.0 
# MALEK Ahmed - 14 / 05 / 2013 
################### 
 
################## 
#--------Config 
################## 
$sourceOU = "OU=OU=testGPO,DC=geuder,DC=local" 
$destinationOU = "OU=TEST,OU=Clients,OU=Computer,OU=.Geuder AG,DC=geuder,DC=local" 
################## 
#--------Main 
################## 
$adPath= "LDAP://" + $destinationOU 
import-module activedirectory 
#Create OUs 
$objDomain=New-Object System.DirectoryServices.DirectoryEntry($adPath) 
$ObjSearch=New-Object System.DirectoryServices.DirectorySearcher($ObjDomain) 
[array] $OUs = @() 
$OUs = dsquery * $sourceOU -Filter "(objectCategory=organizationalUnit)" -limit 0 
$OUsorted = $OUs | sort-object { $_.Length} 
for ($k=0; $k -le $OUsorted.Count -1; $k++) 
{ 
    $OUtoCreate = ($OUsorted[$k] -replace $sourceOU,$destinationOU).ToString() 
    $OUSearch = ($OUtoCreate -replace '"',"").ToString() 
    $ObjSearch.Filter = "(&(objectCategory=organizationalUnit)(distinguishedName="+ $OUSearch + "))" 
    $allSearchResult = $ObjSearch.FindAll() 
    if ($allSearchResult.Count -eq 1) 
    { 
        "No changes were done on = " + $OUtoCreate 
    } 
    else 
    { 
        dsadd ou $OUtoCreate 
        "OU Creation = " + $OUtoCreate 
    } 
} 