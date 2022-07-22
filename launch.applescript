-- key code reference here
-- https://eastmanreference.com/complete-list-of-applescript-key-codes
-- TL;DR: it's a mess
-- Also note that we call space 1 with ^2, space 2 with ^3, etc.
-- so that full-screen Calendar can be treated as space 1

-- this script will run on startup, so give the machine a couple seconds to warm up
delay 5

-- Space 1 - Trello
-- switch to space 1 (using ^2)
tell application "System Events" to tell process "Finder" to key code 19 using {control down}
delay 1
tell application "Trello" to activate
delay 7

-- Space 2 - communication
-- switch to space 2 (using ^3)
tell application "System Events" to tell process "Finder" to key code 20 using {control down}
delay 1
tell application "Signal" to activate
tell application "WhatsApp" to activate
tell application "Telegram" to activate
-- Would love to open Slack thus:
-- tell application "Slack" to activate
-- but Slack is not a good citizen and opens on script load rather than when it is supposed to be executed
-- https://discussions.apple.com/thread/7778059
delay 1

-- Space 3 - Bear and Brave
-- switch to space 3 (using ^4)
tell application "System Events" to tell process "Finder" to key code 21 using {control down}
delay 1
tell application "Bear" to activate
tell application "Brave Browser" to activate
delay 5

-- Space 4 - Sublime and iTerm
-- switch to space 4 (using ^5)
tell application "System Events" to tell process "Finder" to key code 23 using {control down}
delay 1
tell application "Sublime Text" to activate
tell application "iTerm"
	activate
	delay 0.1
	tell current window
		create tab with default profile
		tell the last tab
			tell the last session
				write text "sh ~/setup/lastScreenshotToTextToClipboard.sh"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/setup/"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "ping -c 3 google.com"
			end tell
		end tell
		-- To create a new window in a new space, see here:
		-- https://superuser.com/questions/537458/is-there-a-way-to-script-setting-up-a-space-mission-control-in-osx
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/phd/thesis"
			end tell
		end tell
	end tell
end tell

-- Space 5 - Research
-- switch to space 5 (using ^6)
tell application "System Events" to tell process "Finder" to key code 22 using {control down}
delay 1
tell application "Mendeley Desktop" to activate
delay 12

-- return to space 3
tell application "System Events" to tell process "Finder" to key code 21 using {control down}
