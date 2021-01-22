# debian-setup
Aim of this repo is to keep track of various Linux Debian settings files, shell scripts, and more.

Various tools are used to help reach that goal, for example the cloud-based IDE Codeanywhere (https://codeanywhere.com/) with which it is possible to ssh to the server, and also the IDE Visual Studio Code (https://code.visualstudio.com/) for easily editing Markdown. Therefore Powershell will also be used and customized, for example for adding useful aliases and functions.

The aim of the corresponding Linux Debian machine should be to try to reach and maintain a good security level, for example by:
1. **automating security updates** of the Linux Debian OS (eventually with e-mail reports to root) 
2. **automating back-up processes** of the Filesystem, or at least first of the /home directory 
3. **automating monitoring of installed packages:** how many packages are installed, when have they been installed and updated last, have they already been scanned / parsed by automated security monitoring tools, are they mandatory / required for the operational purpose of the server, or are they mandatory dependency of such packages

Detailed specifications / conception:

## 1. Automatic security updates

see: https://wiki.debian.org/UnattendedUpgrades

Getting advised about security problems:

https://lists.debian.org/debian-security-announce/

