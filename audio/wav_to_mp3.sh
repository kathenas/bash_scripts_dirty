#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have lame installed and available for use.
#
if ! [ -x "$(command -v lame)" ]
then
    echo "lame could not be found."
    echo "Please check you have lame installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Convert audio file (wav) to (mp3). 
#
for in_filename in *.[wW][aA][vV]
do
    lame "$in_filename" "${in_filename%.*}.mp3"
done

#
# Create folder 'original_wav' and then move all (wav) files into that folder.
#
mkdir -p original_wav

for in_filename in *.[wW][aA][vV]
do
    mv -f "$in_filename" original_wav/
done
