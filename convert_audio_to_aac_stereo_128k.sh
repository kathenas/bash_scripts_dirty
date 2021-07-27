#!/bin/bash

#
# Convert mp4 file audio to stereo (2 channel) aac.
#
for in_filename in *.mp4 *.MP4; do
    ffmpeg -i "$in_filename" -codec copy -c:a aac -ac 2 "_${in_filename%.*}.mp4"
done
