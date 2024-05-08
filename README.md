ffmpeg usage

Photo to video

ffmpeg -t 10 -loop 1 -i input -b 16000k -minrate 16000k -maxrate 16000k -bufsize 16000k -ab 64k -s 1920x1080 -y output.ts

-t (time)

-i (input)

-b (bitrate)

-minrate (minimum bitrate)

-maxrate (maximum bitrate)

-bufsize (buffer size)

-ab 64k (64 bit?)

-s (size)

-y (yes to overwrite)

ffmpeg -f concat -i combine.txt -c copy output.ts


