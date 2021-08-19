#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have ffmpeg installed and available for use.
#
if ! [ -x "$(command -v ffmpeg)" ]
then
    echo "ffmpeg could not be found."
    echo "Please check you have ffmpeg installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Information.
#
# The gnome screencast recorder often produces video with poor colouring. The settings below can
# be manipulated to produce a better final production mp4 file for future use, be that on your
# website or social media etc.
#

#
# Settings for the conversion. Edit as required.
#
set_gamma=1.0
set_contrast=1.0
set_brightness=0.0
set_saturation=1.25

#
# Convert gnome internal screencast encoder vp9 webm file to mp4.
#
for in_filename in *.[wW][eE][bB][mM]
do
    ffmpeg -i "$in_filename" \
        -vf eq=gamma="$set_gamma":contrast="$set_contrast":brightness="$set_brightness":saturation="$set_saturation" \
        -crf 10 \
        -codec:v libx264 \
        "${in_filename%.*}.mp4"
done
