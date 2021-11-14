#!/bin/bash

#
# Author: Phil Wyett - philip.wyett@kathenas.org
#
# License: GPL3+ - See: license.txt enclosed in repository.
#

#
# Check we have vorbiscomment installed and available for use.
#
if ! [ -x "$(command -v vorbiscomment)" ]
then
    echo "vorbiscomment could not be found."
    echo "Please check you have vorbiscomment installed on your system."
    echo "Unable to continue. Exiting..."
    exit
fi

#
# Strip ogg file of all metadada. 
#
for in_filename in *.[oO][gG][gG]
do
    vorbiscomment -w "$in_filename" < /dev/null
done
