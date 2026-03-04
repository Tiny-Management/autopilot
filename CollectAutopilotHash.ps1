# CollectAutopilotHash.ps1

$secret = Read-Host "Enter access code"

$serial = (Get-WmiObject Win32_BIOS).SerialNumber
$hash   = (Get-WmiObject -Namespace root/cimv2/mdm/dmmap `
           -Class MDM_DevDetail_Ext01 `
           -Filter "InstanceID='Ext' AND ParentID='./DevDetail'").DeviceHardwareData
$winPID = (Get-WmiObject Win32_OperatingSystem).SerialNumber

$csv = "Device Serial Number,Windows Product ID,Hardware Hash`n$serial,$winPID,$hash"

$payload = @{
    authToken = $secret
    serial    = $serial
    winPID    = $winPID
    hash      = $hash
    csv       = $csv
} | ConvertTo-Json

Invoke-RestMethod `
    -Uri "https://script.google.com/macros/s/AKfycbxcBqcB9drgN_yaf8nXKkxBBKJ1mqjDGcuPW1n0q30i32x0k7FiHpQj3DyGNTZ4TdZTXw/exec" `
    -Method Post `
    -Body $payload `
    -ContentType "application/json"

Write-Host "Hash submitted for device: $serial" -ForegroundColor Green
