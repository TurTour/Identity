Function Get-DsRegCmd{
    $Dsregcmd = New-Object PSObject ; Dsregcmd /status | Where {$_ -match ' : '}|ForEach {$Item = $_.Trim() -split '\s:\s'; $Dsregcmd|Add-Member -MemberType NoteProperty -Name $($Item[0] -replace '[:\s]','') -Value $Item[1] -EA SilentlyContinue}
    return $Dsregcmd
}

$device = Get-DsRegCmd

#$EntraDeviceID = (Get-DsRegCmd).DeviceId
#Connect-MgGraph -NoWelcome
#$deviceObjectId = Get-MgDevice -Filter "deviceId eq '$EntraDeviceID'"

Write-host "DeviceName: $($device.DeviceName)"
Write-host "DeviceID: $($device.DeviceId)"
Write-host "DomainJoined: $($device.DomainJoined)"
Write-host "DomainName: $($device.DomainName)"
Write-host "AzureAdJoined: $($device.AzureAdJoined)"