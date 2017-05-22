#!/bin/bash

# rename JPG to jpg so github displated correctly
for f in IMG*.JPG;
do
	mv "$f" "${f%.JPG}.jpg"
	echo "Rename $f"
done

# find a better way to see what files were last added to the images folder
for i in $(find . -type f -name "IMG*" -ctime -1 -print0 | xargs -0 echo);
do
	echo $i
	# resize images
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		convert -strip -quality 85% -resize 1280 $i $i
	else
        	sips --setProperty formatOptions normal --resampleWidth 1280 $i
	fi
done
