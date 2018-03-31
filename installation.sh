#!/usr/bin/env bash

file1="bumblebee-optirun.desktop"
file2="runwithoptirun.sh"

if [ "$1" == "--uninstall" ]; then
	echo "Uninstalling bumblebee-optirun KDE service: $file1"
	sudo rm /usr/share/kservices5/ServiceMenus/$file1
	echo "Uninstalling helper script: $file2"
	sudo rm /usr/local/bin/$file2
	exit 0
fi

if [ -e $file1 ] && [ -e $file2 ]; then
	echo "Installing bumblebee-optirun KDE service: $file1"
	sudo install -m 0644 ./$file1 /usr/share/kservices5/ServiceMenus/
	echo "Installing helper script: $file2"
	sudo install -m 0755 ./$file2 /usr/local/bin/
else
	echo "Missing $file1 or $file2"
	echo "Can't install, aborting :("
	exit 1
fi
