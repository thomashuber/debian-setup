# 1. Aim of this repo
Aim of this repo is to keep track of various Linux Debian settings files, shell scripts, and more.

Various tools are used to help reach that goal, for example the cloud-based IDE Codeanywhere with which it is possible to ssh to the server, and also the IDE Visual Studio Code for easily editing Markdown (with the Markdown All in One extension from Yu Zhang). Therefore Powershell will also be used and customized, for example for adding useful aliases and functions.

**Table of Contents:**

- [1. Aim of this repo](#1-aim-of-this-repo)
- [2. Debian](#2-debian)
  - [2.1. Automatic security updates](#21-automatic-security-updates)
  - [2.2. Automating back-up processes](#22-automating-back-up-processes)
  - [2.3. Automating monitoring](#23-automating-monitoring)
    - [Installed packages](#installed-packages)
    - [Configuration files integrity](#configuration-files-integrity)
  - [2.4. Reinstallation procedure](#24-reinstallation-procedure)
- [3. Other interesting Linux distributions](#3-other-interesting-linux-distributions)
  - [3.1. Alpine Linux](#31-alpine-linux)
- [4. Useful commands / Miscellaneous](#4-useful-commands--miscellaneous)

# 2. Debian

The aim of the corresponding Linux Debian machine should be to try to reach and maintain a good security level, for example by:
1. **automating security updates** of the Linux Debian OS (eventually with e-mail reports to root) 
2. **automating back-up processes** of the Filesystem, or at least first of the /home directory 
3. **automating monitoring** 
   - **of installed packages:** how many packages are installed, when have they been installed and updated last, have they already been scanned / parsed by automated security monitoring tools, are they mandatory / required for the operational purpose of the server, or are they mandatory dependency of such packages
   - **of configuration files:**

## 2.1. Automatic security updates

see: https://wiki.debian.org/UnattendedUpgrades

Getting advised about security problems:

https://lists.debian.org/debian-security-announce/

```
#Installing required packages
~$ apt-get install unattended-upgrades apt-listchanges

#Symlinking config files into home directory, for easier Git tracking
#and back-up
~$ mkdir etc/
~$ mkdir etc/apt/
~$ mkdir etc/apt/apt.conf.d/

#50unattended-upgrades
~$ sudo mv /etc/apt/apt.conf.d/50unattended-upgrades etc/apt/apt.conf.d/
~$ sudo ln -s ~/debian-setup/etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades

#20auto-upgrades
~$ sudo dpkg-reconfigure -plow unattended-upgrades
~$ sudo mv /etc/apt/apt.conf.d/20auto-upgrades etc/apt/apt.conf.d/
~$ sudo ln -s ~/debian-setup/etc/apt/apt.conf.d/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades

#100update
#see check_config.sh
```

## 2.2. Automating back-up processes

## 2.3. Automating monitoring 

### Installed packages

A private Github repository will be used to monitor installed packages, and changes made to the installed packages, for example through automatic updates.

### Configuration files integrity

Could be achieved with a bash shell script.
see: [check_config.sh](check_config.sh)

## 2.4. Reinstallation procedure

The underlying physical machine of the Debian server is supplied by OVHcloud, which also provides a control panel to reboot the machine or reinstall the system.

SSH Keys are also managed with the OVHcloud control panel.

The Reinstallation procedure could therefore be executed with following steps:

1. Connect to the OVHcloud Control panel
2. Ensure the default SSH public key is the one which is currently installed client-side (the corresponding private part of the key) (At the time writing, 2021/02/13, the only client used to ssh to the server is Codeanywhere). <br /><span style="color:lime;">(i)</span> The SSH key which is specified in the OVHcloud Control is the public part of the key.
3. Reinstall the latest Debian Stable from OVHcloud control pannel.
4. `~$ apt-get install unattended-upgrades apt-listchanges`
   <br />
   `~$ cd ~ && git clone https://github.com/thomashuber/debian-setup.git`
   <br />
   `~$ bash ./check_config.sh`
   <br />
   And follow instructions for recreating symlinks.

# 3. Other interesting Linux distributions

## 3.1. Alpine Linux

https://alpinelinux.org/

*"Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox."*

# 4. Useful commands / Miscellaneous

| ID | Command                   | Description                                 |
| :---: | :------------------------ | :------------------------------------------ |
| 1 | sudo apt list --installed | lists all packages installed on your system, including information about the package versions and architecture. |
| 2 | sudo apt list --installed \| less | Same as above, but piped to less for making it easier to read. |
| 3 | sudo dpkg-query -l \| less | lists all installed packages, with a short description. Not sure if it may gives different results from Command ID 1 |
| 4 | sudo dpkg-query -f '${binary:Package}\n' -W > packages_list.txt | store the list of all installed packages on your Debian system to a file called packages_list.txt
| 5 | sudo xargs -a packages_list.txt apt install | install the same packages on a new server (can be useful for restoring or duplicating a production server maybe)
| 6 | sudo dpkg-query -f '${binary:Package}\n' -W \| wc -l | Count the Number of Installed Packages