#!/bin/bash

# find last screenshot, extract text, change newlines for spaces, copy it to clipboard
tesseract ~/Desktop/"$(ls -1 ~/Desktop/ | grep Screen\ Shot\ 20 | tail -1)" .lastScreenshotToTextToClipboard.temp && tr '\n' ' ' < .lastScreenshotToTextToClipboard.temp.txt | pbcopy
# delete temporary file
rm .lastScreenshotToTextToClipboard.temp.txt
