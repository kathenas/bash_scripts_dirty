#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have ffmpeg installed and available for use.
#
if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg could not be found."
    echo "Please check you have ffmpeg installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Convert mp4 file audio to stereo (2 channel) aac.
#
for in_filename in *.mp4 *.MP4; do
    ffmpeg -i "$in_filename" -codec copy -c:a aac -ac 2 "_${in_filename%.*}.mp4"
done
