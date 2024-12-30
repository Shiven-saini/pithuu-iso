### Author : Shiven Saini ####
### Email : shivensaini73@gmail.com ###

# Bash Script to clean & prepare the working directories before build 
# Run with sudo privileges as most of work folder files maybe owned by root.

#/bin/bash

if [[ -z "$SUDO_USER" ]]; then
	echo "Please re-run this script with sudo privileges!"
	exit 1
fi

echo "[$0] : Deleting the directories...."
rm -rf ../work/ ../build/


echo "[$0] : Creating and setting the required permissions on working directories..."
for DIR in work build ; do
	install -dm755 "../$DIR"
done

echo "[$0] : Cleaning done!"