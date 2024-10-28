# Thinkpad X1 Tablet Gen 3 Linux Stuff

This repository provides scripts to enhance the user experience on the ThinkPad X1 Tablet Gen 3 when running Debian-based Linux distributions. These scripts optimize touchscreen functionality, enable screen rotation on device orientation changes, and provide a widget for toggling rotation on demand.

## Scripts Overview

- **disable_wacom_gestures.sh**  
  Disables Wacom touch gestures to improve touchscreen accuracy. Basic gestures will still function as expected.

- **rotate_screen.sh**  
  Adds automatic screen rotation based on the device’s orientation.

- **rotate_widget.sh**  
  Enables or disables screen rotation on demand. This script can be used as a widget (via quick launch) or a standalone shortcut.

## Setup Guide

1. **Download and Unpack**  
   Download the files and unpack them into a folder of your choice.

2. **Make Scripts Executable**  
   Open a terminal in the folder where you unpacked the files and run the following commands:
   ```bash
   chmod +x rotate_screen.sh
   chmod +x rotate_widget.sh
   chmod +x disable_wacom_gestures.sh
   ```
3. **Autostart Scripts**
To ensure the scripts run on login, add disable-wacom-gestures.sh and rotate_screen.sh to your system’s autostart configuration. (Note: the process varies depending on your distro.)

4. **Add a Widget or Shortcut for rotate_widget.sh**
Set up a shortcut or toolbar widget to call rotate_widget.sh so you can easily toggle screen rotation as needed.

5. **Reboot**

6. **Enjoy**

**Notes**:
You can use rotate_widget.sh without adding it to autostart. The script saves the current rotation state in a file. This was done to ensure it is compatible with distros like Kubuntu.
