#!/bin/bash

if [ "$1" == "" ]; then
    echo "Missing target mp4 file"
fi

# ffmpeg -y -i $1 -r 30 -b:a 2M -bt 4M -vcodec libx264 -pass 1 -coder 0 -bf 0 -flags -loop -wpredp 0 -an tmp/payload.mp4
ffmpeg -y -i $1 -r 24 -b:a 2M -bt 4M -vcodec libx264 -pass 1 -coder 0 -bf 0 -flags -loop -wpredp 0 -an -vf scale=w=640:h=360:force_original_aspect_ratio=decrease tmp/payload.mp4
ffmpeg -y -i $1 -q:a 0 -map a tmp/audio.mp3
node generate.js tmp/payload.mp4
./deliver.sh payload
node generate.js tmp/audio.mp3
./deliver.sh payload
