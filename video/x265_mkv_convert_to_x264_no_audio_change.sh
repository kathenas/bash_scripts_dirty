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
# Settings for the conversion. Edit as required.
#
# Set quality (crf) - 0 is best quality to 51 which is lowest quality.
set_crf=22

#
# Convert mkv file x265 encoded to x264 encoded mp4.
#
for in_filename in *.[mM][kK][vV]
do
    ffmpeg -i "$in_filename" -c:v libx264 -crf "$set_crf" -c:a copy "${in_filename%.*}.mp4"
done
