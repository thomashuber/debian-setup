# debian-setup
Aim of this repo is to keep track of various Linux Debian settings files, shell scripts, and more.

Various tools are used to help reach that goal, for example the cloud-based IDE Codeanywhere (https://codeanywhere.com/) with which it is possible to ssh to the server, and also the IDE Visual Studio Code (https://code.visualstudio.com/) for easily editing Markdown. Therefore Powershell will also be used and customized, for example for adding useful aliases and functions.

**Table of Contents:**

[Debian](#a-debian)
1. [Automating security updates](#1-automatic-security-updates)
2. Automating back-up processes
3. Automating monitoring of installed packages

[Other interesting Linux distributions](#b-other-interesting-linux-distributions)
   1. [Alpine Linux](#1-alpine-linux)

# A. Debian

The aim of the corresponding Linux Debian machine should be to try to reach and maintain a good security level, for example by:
1. **automating security updates** of the Linux Debian OS (eventually with e-mail reports to root) 
2. **automating back-up processes** of the Filesystem, or at least first of the /home directory 
3. **automating monitoring of installed packages:** how many packages are installed, when have they been installed and updated last, have they already been scanned / parsed by automated security monitoring tools, are they mandatory / required for the operational purpose of the server, or are they mandatory dependency of such packages

## 1. Automatic security updates

see: https://wiki.debian.org/UnattendedUpgrades

Getting advised about security problems:

https://lists.debian.org/debian-security-announce/

# B. Other interesting Linux distributions

## 1. Alpine Linux

https://alpinelinux.org/

*"Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox."*