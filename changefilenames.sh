#!/bin/bash

unset img
img=1

for i in *.jpg
do
	new=$(printf "%d.jpg" "$img")
	mv -i -- "$i" "$new"
	((img=img+1))
done
