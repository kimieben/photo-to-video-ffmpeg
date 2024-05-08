#!/bin/bash

#check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# setting for the number of files and total images
unset files total_images
files=1

# remove if file existed
rm concat_video.txt

# ask user for total image count
read -p "Total images?" total_images

# run the program 
until [ $files -gt $total_images ]
do
	# currently procesing image set
 	unset right_now
	right_now=$files
	echo "Currently processing image to video is $right_now.jpg"
 
 	# changing the iamge into video command
	ffmpeg -t 10 -loop 1 -i $right_now.jpg -b 10240k -minrate 10240k -maxrate 10240k -bufsize 10240k -ab 64k -s 1920x1080 -y $right_now.ts

 	# add the file name into the file to be read when concat ffmpeg
 	echo "file $right_now.ts" >> concat_video.txt
	# repeat until total_images
 	((files=files+1))
done

# combine two video command
ffmpeg -f concat -i concat_video.txt -c copy -y combined_video.ts

# final message
echo "Converting $total_images images to 1 video is done"

unset i

i=1

until [ $i -gt $total_images ]
do
	rm $i.ts
  	echo "Removed $i.ts"
 	((i=i+1))
done
