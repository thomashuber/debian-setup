#!/usr/bin/env bash

ERRORS_NUMBER_DIR=0
ERRORS_NUMBER_SYMLINKS=0
ERRORS_NUMBER_CONFFILES=0

#----------------------------#
#  Directories 
#----------------------------#
if [[ ! -d /etc/apt/apt.conf.d/ ]]; then
  ((ERRORS_NUMBER_DIR = ERRORS_NUMBER_DIR + 1))
  echo "/etc/apt/apt.conf.d/ not a directory"
fi
if [[ ! -d ~/debian-setup/etc/apt/apt.conf.d/ ]]; then
  ((ERRORS_NUMBER_DIR = ERRORS_NUMBER_DIR + 1))
  echo "~/debian-setup/etc/apt/apt.conf.d/ not a directory"
fi

#----------------------------#
#  Symlinks
#----------------------------#
if [[ ! -h /etc/apt/apt.conf.d/50unattended-upgrades ]]; then
  ((ERRORS_NUMBER_SYMLINKS = ERRORS_NUMBER_SYMLINKS + 1))
  echo "/etc/apt/apt.conf.d/50unattended-upgrades not a symlink" 
fi
if [[ ! -h /etc/apt/apt.conf.d/20auto-upgrades ]]; then
  ((ERRORS_NUMBER_SYMLINKS = ERRORS_NUMBER_SYMLINKS + 1))
  echo "/etc/apt/apt.conf.d/20auto-upgrades not a symlink" 
fi
if [[ ! -h ~/.bash_aliases ]]; then
  ((ERRORS_NUMBER_SYMLINKS = ERRORS_NUMBER_SYMLINKS + 1))
  echo "~/.bash_aliases not a symlink. Issue command 'ln -s ~/debian-setup/.bash_aliases ~/.bash_aliases'" 
fi

#----------------------------#
#  Configuration files
#----------------------------#
if [[ ! -s ~/debian-setup/etc/apt/apt.conf.d/50unattended-upgrades ]]; then
  ((ERRORS_NUMBER_CONFFILES = ERRORS_NUMBER_CONFFILES + 1))
  echo "~/debian-setup/etc/apt/apt.conf.d/50unattended-upgrades does not exist or is empty" 
fi
if [[ ! -s ~/debian-setup/etc/apt/apt.conf.d/20auto-upgrades ]]; then
  ((ERRORS_NUMBER_CONFFILES = ERRORS_NUMBER_CONFFILES + 1))
  echo "~/debian-setup/etc/apt/apt.conf.d/20auto-upgrades  does not exist or is empty" 
fi
if [[ ! -s ~/debian-setup/.bash_aliases ]]; then
  ((ERRORS_NUMBER_CONFFILES = ERRORS_NUMBER_CONFFILES + 1))
  echo "~/debian-setup/.bash_aliases does not exist or is empty" 
fi

if [[ ERRORS_NUMBER_DIR -eq 0 && 
      ERRORS_NUMBER_SYMLINKS -eq 0 &&
      ERRORS_NUMBER_CONFFILES -eq 0 ]]; then
echo "All Tests OK."
fi