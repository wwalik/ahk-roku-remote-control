# AutoHotKey Keyboard Shortcuts for Roku TV Remote Control
> [!NOTE]
> If you are looking for a GUI application, Roku already provides one as part of their SDK. You can find it [here](https://developer.roku.com/en-ca/docs/developer-program/dev-tools/roku-remote-tool.md).
## Introduction
This project contains a short [AutoHotKey](https://www.autohotkey.com/) script that enables Roku TV devices to be controlled over LAN using keyboard shortcuts.

> [!WARNING]
> This script is intended to be modified before use, you should **at a minimum** set the correct Roku TV IP address in the script. This can be accomplished by editing the value of the ``TV_IP`` variable at the top of the file. You can learn how to find your TV's IP address [here](#where-can-i-find-my-roku-tvs-ip-address).

Since this is an AutoHotKey script, it can only be run on Windows.
## Prerequisites
To use this script successfully, you must:
- Set the correct IP in the script's source code
- Set "Control by mobile apps" to "Permissive" or "Enabled" in your Roku TV's advanced settings[^1]
- Install [cURL](https://curl.se/) on your machine if it is not already[^2]

[^1]: For more information, see https://developer.roku.com/en-ca/docs/developer-program/dev-tools/external-control-api.md
[^2]: This should not be an issue as cURL is installed by default on windows 10 and later versions.
## Default Controls
> [!TIP]
> If your keyboard does not have a numpad or if you would like different shortcuts, this [page](https://www.autohotkey.com/docs/v1/Hotkeys.htm) can teach you how to modify the script to your needs.

**General commands**
| Command |     Prefix    | Keyboard shortcut |
|:-------:|:-------------:|:-----------------:|
|  Power  | Control+Shift |     _Numpad -_    |
|   Home  | Control+Shift |   _Numpad Enter_  |
|   Back  | Control+Shift |     _Numpad +_    |
|  Select | Control+Shift |     _Numpad 5_    |

**Direction keys**
| Direction | Prefix        | Keyboard shortcut |
|-----------|---------------|-------------------|
| Up        | Control+Shift | _Numpad 8_        |
| Right     | Control+Shift | _Numpad 6_        |
| Down      | Control+Shift | _Numpad 2_        |
| Left      | Control+Shift | _Numpad 4_        |

**Text Input**
| Command   | Prefix        | Keyboard shortcut |
|-----------|---------------|-------------------|
| Send text | Control+Shift | _Numpad ._        |

Note: This command opens a dialog box where you can enter text to be sent to the Roku TV.
## Tips and FAQ
### Static IP
Your Roku TV's IP address might change for a number of reasons, including DHCP lease renewal, router restarts, or power outages. Each time this happens, you will have to readjust the ``TV_IP`` variable accordingly. As Roku TVs do not support setting a static IP address directly in the device's menu, the only way to prevent this is to reserve an IP address for your Roku TV in your router's (DHCP) settings. You can google "how to configure a static ip address on a router" for more information.

### Where can I find my Roku TV's IP address?
On your Roku TV, go to ``Settings > Network > About``. You should see your IP address listed on the right side of the screen.

## How does it work?
Roku TV devices are equipped with a simple RESTful API called the External Control Protocol (ECP). This script sends HTTP POST requests to the device using cURL. You can learn more about the ECP on Roku TVs [here](https://developer.roku.com/en-ca/docs/developer-program/dev-tools/external-control-api.md).
