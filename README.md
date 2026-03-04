In order to enroll a device in Autopilot, a hash needs to be generated on the device.

## For New Installs
During the install phase, hit Shift-F10 to open a System32 window, then run:
```
powershell -Command "& { Install-Script Get-WindowsAutopilotInfo -Force; Get-WindowsAutopilotInfo -Online }"
```

## For Existing Installs
Open a Powershell session and run the following command to download and run the hash generator.
```
irm "https://raw.githubusercontent.com/Tiny-Management/autopilot/CollectAutopilotHash.ps1" | iex
```

