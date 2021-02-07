#!/usr/bin/env bash

ERRORS_NUMBER_DIR=0
ERRORS_NUMBER_SYMLINKS=0
ERRORS_NUMBER_CONFFILES=0

#----------------------------#
#  Directories 
#----------------------------#
Directories[0]=/etc/apt/apt.conf.d/
Directories+=(/usr/local/bin/)
Directories+=(~/debian-setup/etc/apt/apt.conf.d/)
Directories+=(~/debian-setup/usr/local/bin/)
for i in "${Directories[@]}"; do
  if [[ ! -d $i ]]; then
    ((ERRORS_NUMBER_DIR = ERRORS_NUMBER_DIR + 1))
    echo "$i not a directory"
  fi
done

#----------------------------#
#  Symlinks
#----------------------------#
Symlinks[0]=/etc/apt/apt.conf.d/50unattended-upgrades
Symlinks+=(/etc/apt/apt.conf.d/20auto-upgrades)
Symlinks+=(/etc/apt/apt.conf.d/100update)
Symlinks+=(~/.bash_aliases)
for i in "${Symlinks[@]}"; do
  if [[ ! -h $i ]]; then
    ((ERRORS_NUMBER_SYMLINKS = ERRORS_NUMBER_SYMLINKS + 1))
    echo "$i not a symlink."
    echo "Please issue command 'ln -s ~/debian-setup$i $i'"
  fi
done

#----------------------------#
#  Configuration files
#----------------------------#
Conffiles[0]=~/debian-setup/etc/apt/apt.conf.d/50unattended-upgrades
Conffiles+=(~/debian-setup/etc/apt/apt.conf.d/20auto-upgrades)
Conffiles+=(~/debian-setup/etc/apt/apt.conf.d/100update)
Conffiles+=(~/debian-setup/.bash_aliases)
for i in "${Conffiles[@]}"; do
  if [[ ! -s $i ]]; then
    ((ERRORS_NUMBER_CONFFILES = ERRORS_NUMBER_CONFFILES + 1))
    echo "$i does not exist or is empty" 
  fi
done

if [[ ERRORS_NUMBER_DIR -eq 0 && 
      ERRORS_NUMBER_SYMLINKS -eq 0 &&
      ERRORS_NUMBER_CONFFILES -eq 0 ]]; then
echo "All Tests OK."
fi