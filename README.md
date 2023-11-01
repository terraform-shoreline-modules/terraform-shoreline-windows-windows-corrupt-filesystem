
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Corrupt System Files and Filesystem on Windows Machine
---

This incident type refers to the occurrence of corrupt system files and a corrupt filesystem on a Windows machine. This can cause a variety of issues such as system crashes, error messages, and data loss. It is important to address this issue promptly to prevent further damage to the system and potential data loss.

### Parameters
```shell
export DRIVE_LETTER="PLACEHOLDER"
```

## Debug

### Check disk for errors
```shell
chkdsk ${DRIVE_LETTER}: /f /r
```

### Check system files for errors
```shell
sfc /scannow
```

### Check disk for bad sectors
```shell
wmic diskdrive get status
```

### Check disk health
```shell
wmic diskdrive get status, availability
```

### Check disk usage
```shell
wmic logicaldisk get name, freespace, systemname, size
```

### Check disk event logs for errors
```shell
Get-EventLog -LogName Application -Source "Microsoft-Windows-Ntfs" -After (Get-Date).AddDays(-7)
```

### Scan for malware
```shell
Windows Defender: Start-MpWDOScan
```

### Check disk fragmentation
```shell
defrag ${DRIVE_LETTER}: /a
```

### Repair corrupt system files
```shell
DISM /Online /Cleanup-Image /RestoreHealth
```

### Check system event logs for errors
```shell
Get-EventLog -LogName System -EntryType Error
```

## Repair

### Check the hard drive for errors and bad sectors using a disk utility tool.
```shell


#!/bin/bash



# Specify the drive letter to check (e.g. C: or D:)

drive_letter=${DRIVE_LETTER}



# Run chkdsk command with /f and /r options to fix errors and locate bad sectors

chkdsk ${DRIVE_LETTER} /f /r



# Check the exit code of the previous command to see if any errors were fixed

if [ "$?" -eq 0 ]; then

  echo "Drive ${DRIVE_LETTER} checked and fixed successfully."

else

  echo "Error: Drive ${DRIVE_LETTER} check failed."

fi


```