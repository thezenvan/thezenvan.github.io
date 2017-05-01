#!/bin/bash

# find a better way to see what files were last added to the images folder
for i in $(find . -type f -name "IMG*" -ctime -1 -print0 | xargs -0 echo);
do
	echo $i;
	# resize images
        sips --resampleWidth 1280 $i
done
