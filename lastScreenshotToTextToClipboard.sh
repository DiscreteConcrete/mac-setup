#!/bin/bash

# watch for changes
# for some strange reason file only stores the file up to the first space and event the rest, while appending 592 on creation
# so echo $file
# would return something like: /Users/tomash/Desktop/Screen
# and echo $event
# Shot 2020-02-10 at 21.50.11.png 592
# also note that since some version of Mac OS it's "Screenshot", not "Screen Shot"
fswatch --batch-marker=EOF -xn ~/Desktop/ | while read file event; do 
	# to enable echoing all file activity
	# echo $file $event
	if [[ "$file $event" == */Screen\ Shot\ 20*.png\ 592 ]]; then
		# find last screenshot, extract text, change newlines for spaces, copy it to clipboard
		tesseract ~/Desktop/"$(ls -1 ~/Desktop/ | grep Screen\ Shot\ 20 | tail -1)" .lastScreenshotToTextToClipboard.temp && tr '\n' ' ' < .lastScreenshotToTextToClipboard.temp.txt | pbcopy
		# delete temporary file
		rm .lastScreenshotToTextToClipboard.temp.txt
		echo "Text from screenshot copied to clipboard."
	fi

	if [[ "$file $event" == */Screenshot\ 20*.png\ 592 ]]; then
		# find last screenshot, extract text, change newlines for spaces, copy it to clipboard
		tesseract ~/Desktop/"$(ls -1 ~/Desktop/ | grep Screenshot\ 20 | tail -1)" .lastScreenshotToTextToClipboard.temp && tr '\n' ' ' < .lastScreenshotToTextToClipboard.temp.txt | pbcopy
		# delete temporary file
		rm .lastScreenshotToTextToClipboard.temp.txt
		echo "Text from screenshot copied to clipboard."
	fi
done
