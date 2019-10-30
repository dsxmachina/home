<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Handy dmenu scripts](#handy-dmenu-scripts)
    - [dmenuwifi](#dmenuwifi)
    - [dmenukill](#dmenukill)
    - [dmenuMonitor](#dmenumonitor)
    - [newCMakeProject](#newcmakeproject)
- [Non-dmenu scripts](#non-dmenu-scripts)
    - [addURL](#addurl)
    - [changeVolume](#changevolume)
    - [getMails](#getmails)
    - [i3lockColor](#i3lockcolor)
- [That's not my stuff!](#thats-not-my-stuff)
    - [dmenumount & dmenuunmount & i3resize](#dmenumount--dmenuunmount--i3resize)

<!-- markdown-toc end -->

# Handy dmenu scripts
## dmenuwifi

I haven't found any program to connect to a wifi without using a mouse, so i wrote this little script.
It needs a folder (mine is under ~/.config/wireless) where it stores all know wifis and their passworts (and proxy urls if used).
"Oh no, it is super unsafe! It saves the passwords in plain text!!".. Yeah, kind of..
But i really don't care if anyone who has acess to my laptop can steal my wifi password.
If you want, you can modify it, so it can use gnupg or pass to store the password encrypted.

Requires:
- dmenu
- NetworkManager (since it uses nmcli to connect)
- (a notification manager if you want)

## dmenukill

This is a small kind of task-manager, that allows you to quickly select a program you wanna terminate.
It uses dmenu to give you a list of all running programs (and some of their properties).
The selected program is terminated by `kill`

Requires:
- dmenu

## dmenuMonitor

I use this to quickly adjust my monitor settings under i3. When i use a second screen on my laptop,
i want it to be on top of my laptop screen and i want several workspaces to move to that monitor, if they exist.
Sometimes, i have an additional beamer attached to my laptop and want to mirror my primary screen.
This script allows me to quickly toggle between presentation mode (which mirrors the primary monitor), "work-mode" with one and "work-mode" with two monitors.
If just one additional monitor is attached, dmenu is not used.
You may want to change the primary monitors name accorging to your configuration.

Requires:
- xrandr
- dmenu (you can select the monitor via dmenu (if more than one other monitor is attached))
- i3 (not really, but it is mainly used to reorder workspaces after attaching or removing another monitor)

Usage:
```bash
# if you attached or removed another monitor, this re-orders your workspaces
dmenuMonitor
# to mirror your primary screen
dmenuMonitor --mirror
```

## newCMakeProject

I often use opencv in c++ projects and build them with cmake. Since the CMakeLists.txt always looks almost the same,
i wrote this litte script to make the whole process faster.
My projects are all located in "~/Projekte" and sorted in seperate subfolders like "~/Projekte/Category/Sub-Project/".
This script asks you for a project name, a category (which is a subfolder in my project folder) and if you want to add any libraries
(which i always put under /usr/lib). After that it creates the project folder in the given category folder, puts a main.cpp, project_name.h, project_name.cpp there and creates a simple CMakeLists.txt accordingly (links the libraries and opencv).
I don't know if this is useful to anyone else, but ... meh.

Requires:
- dmenu

# Non-dmenu scripts
## addURL

This script is used to forward a youtube video from the clipboard to an instance of mpv.

Requires:
- xclip
- mpv & youtube-dl

Also mpv has to be opened with the following flag:
```bash
mpv --input-ipc-server=/tmp/mpvsoc$(date +%s)'
```
Otherwise the script won't find the open application.

Usage:
Just call the script and it will take the URL from your clipboard.

## changeVolume

As the name suggests, this script controls my volume. It also updates the corresponding block of my i3blocks-bar.
You may want to adapt the audio sink according to your own system.

Requires:
- pulseaudio
- i3blocks (not really, but kind of)

Usage:
```bash
# Increase Volume by 15% (absolute Value)
changeVolume +15
# Decrease Volume by 3% (absolute Value)
changeVolume -3
# Mute
changeVolume m
# Unmute
changeVolume u
```

## getMails

I use offlineimap over a davmail bridge to connect neomutt to my exchange email account.
This script invokes offlineimap after opening davmail (if davmail is not running atm) and is executed,
everytime i switch to the workspace where neomutt is opened (see my i3 config).

Requires (obviously):
- davmail
- offlineimap

## i3lockColor

Calls i3lockColor with my prefered configuration (just blury screen, no ring, and you don't see the typing).
Nothing special.

Requires:
- i3lock-color (see [here](https://github.com/PandorasFox/i3lock-color))


# That's not my stuff!
## dmenumount & dmenuunmount & i3resize

Not mine! They are written by Luke Smith.
You should definetely [checkout his github](https://gist.github.com/LukeSmithxyz), if you are interested in fancy bash scripts and i3 configuration.
