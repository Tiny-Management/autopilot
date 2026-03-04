# Save as: CollectAutopilotHash.ps1

$serial = (Get-WmiObject Win32_BIOS).SerialNumber
$csv = "C:\autopilot-$serial.csv"

# Self-contained hash collection - no internet required
$devDetail = (Get-WmiObject -Namespace root/cimv2/mdm/dmmap -Class MDM_DevDetail_Ext01 -Filter "InstanceID='Ext' AND ParentID='./DevDetail'")
$hash = $devDetail.DeviceHardwareData

$obj = [PSCustomObject]@{
    "Device Serial Number" = $serial
    "Windows Product ID"   = (Get-WmiObject Win32_OperatingSystem).SerialNumber
    "Hardware Hash"        = $hash
}

$obj | Export-Csv -Path $csv -NoTypeInformation
Write-Host "Hash saved to $csv" -ForegroundColor Green
