Application

Before running the scripts, you need to get a working spin-off POST request from KA first. They were not included since it is sensitive information.

==============
```sh
./index.sh $TARGETFILE
```

Encoding Video (From https://github.com/mbebenita/Broadway)
==============

The decoder expects an .mp4 file and does not support weighted prediction for P-frames and CABAC entropy encoding. To create such bitstreams use ffmpeg and x264 with the following command line options:

```sh
ffmpeg -i $SOURCEFILE -r $FRAMERATE -b:a 2M -bt 4M -vcodec libx264 -pass 1 -coder 0 -bf 0 -flags -loop -wpredp 0 -an targetFile.mp4
```

Encoding Audio
==============
```sh
ffmpeg -i $SOURCEFILE -q:a 0 -map a targetFile.mp3
```
