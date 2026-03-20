In order to enroll a device in Autopilot, a hash needs to be generated on the device.

## For New Installs
During the install phase, hit Shift-F10 to open a System32 window, then run:
```
powershell -Command "& { Install-Script Get-WindowsAutopilotInfo -Force; Get-WindowsAutopilotInfo -Online }"
```

## For Existing Installs
Open a Powershell session as Administrator and run the following command to download and run the hash generator.
```
irm "https://raw.githubusercontent.com/Tiny-Management/autopilot/refs/heads/main/CollectAutopilotHash.ps1" | iex
```
This generates a CSV with the hardware hash, serial number, and device ID that you upload directly to **Intune > Devices > Enroll Devices > Windows Autopilot Deployment Program > Devices > Import**.

It will ask for a hash phrase, which is stored in the Google Apps Script endpoint.  To view, log in as Super Admin.

https://script.google.com/home/projects/1pfP1_pPRfAQTwqC9mg5JcDnDgbeKYS345qbwoXvRxpR-_uqMhtoa78k5/edit
