#!/usr/bin/env bash

ERRORS_NUMBER=0

if [[ ! -d /etc/apt/apt.conf.d/ ]]; then
  ((ERRORS_NUMBER = ERRORS_NUMBER + 1))
  echo "/etc/apt/apt.conf.d/ not a directory"
fi
if [[ ! -d ~/etc/apt/apt.conf.d/ ]]; then
  ((ERRORS_NUMBER = ERRORS_NUMBER + 1))
  echo "~/etc/apt/apt.conf.d/ not a directory"
fi

if [[ ! -h /etc/apt/apt.conf.d/50unattended-upgrades ]]; then
  ((ERRORS_NUMBER = ERRORS_NUMBER + 1))
  echo "/etc/apt/apt.conf.d/50unattended-upgrades not a symlink" 
fi
if [[ ! -h /etc/apt/apt.conf.d/20auto-upgrades ]]; then
  ((ERRORS_NUMBER = ERRORS_NUMBER + 1))
  echo "/etc/apt/apt.conf.d/20auto-upgrades not a symlink" 
fi

if [[ ! -s ~/etc/apt/apt.conf.d/50unattended-upgrades ]]; then
  ((ERRORS_NUMBER = ERRORS_NUMBER + 1))
  echo "~/etc/apt/apt.conf.d/50unattended-upgrades does not exist or is empty" 
fi
if [[ ! -s ~/etc/apt/apt.conf.d/20auto-upgrades ]]; then
  ((ERRORS_NUMBER = ERRORS_NUMBER + 1))
  echo "~/etc/apt/apt.conf.d/20auto-upgrades  does not exist or is empty" 
fi

echo "Number of errors found: $ERRORS_NUMBER"