-- key code reference here
-- https://eastmanreference.com/complete-list-of-applescript-key-codes
-- TL;DR: it's a mess
-- Also note that we call space 1 with ^2, space 2 with ^3, etc.
-- so that full-screen Calendar can be treated as space 1

-- this script will run on startup, so give the machine a second to warm up
delay 1

-- Space 1 - Trello
-- switch to space 1 (using ^2)
tell application "System Events" to tell process "Finder" to key code 19 using {control down}
delay 1
tell application "Trello" to activate
delay 3

-- Space 2 - communication
-- switch to space 2 (using ^3)
tell application "System Events" to tell process "Finder" to key code 20 using {control down}
delay 1
tell application "WhatsApp" to activate
tell application "Signal" to activate
tell application "Telegram" to activate
-- Would love to open Discord like this, but it's not a good citizen can can take 40 seconds of update installations to start
-- tell application "Discord" to activate
-- Would love to open Slack thus:
-- tell application "Slack" to activate
-- but Slack is not a good citizen and opens on script load rather than when it is supposed to be executed
-- https://discussions.apple.com/thread/7778059
-- many of them either recapture focus when they load or just load in the desktop at the time of finishing loading, so need to wait for them before continuing
delay 6

-- Space 3 - Bear and Brave
-- switch to space 3 (using ^4)
tell application "System Events" to tell process "Finder" to key code 21 using {control down}
delay 1
tell application "Bear" to activate
tell application "Brave Browser" to activate
delay 4

-- Space 4 - Sublime and Terminal
-- switch to space 4 (using ^5)
tell application "System Events" to tell process "Finder" to key code 23 using {control down}
delay 1
tell application "Visual Studio Code" to activate
tell application "Sublime Text" to activate
tell application "Warp" to activate
tell application "Terminal"
	activate
	delay 1
	repeat while contents of selected tab of front window starts with linefeed
		delay 0.01
	end repeat
	do script "sh ~/setup/lastScreenshotToTextToClipboard.sh" in front window
	-- 	-- opening new tab taken from here https://superuser.com/a/466650
	-- 	tell application "System Events" to keystroke "t" using command down
	-- 	repeat while contents of selected tab of front window starts with linefeed
	-- 		delay 0.01
	-- 	end repeat
	-- 	do script "cd ~/setup/" in front window
	-- 	tell application "System Events" to keystroke "t" using command down
	-- 	repeat while contents of selected tab of front window starts with linefeed
	-- 		delay 0.01
	-- 	end repeat
	-- 	do script "ping -c 1 google.com" in front window
	-- 	tell application "System Events" to keystroke "t" using command down
	-- 	repeat while contents of selected tab of front window starts with linefeed
	-- 		delay 0.01
	-- 	end repeat
	-- 	do script "cd ~/phd/thesis" in front window
end tell


-- Space 5 - Research
-- switch to space 5 (using ^6)
-- tell application "System Events" to tell process "Finder" to key code 22 using {control down}
-- delay 1
-- tell application "Mendeley Desktop" to activate
-- delay 12

-- return to space 3
tell application "System Events" to tell process "Finder" to key code 21 using {control down}
