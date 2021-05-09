-- key code reference here
-- https://eastmanreference.com/complete-list-of-applescript-key-codes
-- TL;DR: it's a mess
-- Also note that we call space 1 with ^2, space 2 with ^3, etc.
-- so that full-screen Calendar can be treated as space 1

-- this script will run on startup, so give the machine a couple seconds to warm up
delay 5

-- Calendar
-- switch to space 1 (using ^2)
tell application "System Events" to tell process "Finder" to key code 19 using {control down}
delay 1
tell application "Calendar" to activate
delay 1
tell application "System Events" to tell process "Calendar"
	set value of attribute "AXFullScreen" of window 1 to true
end tell
-- TODO: move the fullscreen app to be before space 1

-- Space 1 - Trello
-- switch to space 1 (using ^2)
tell application "System Events" to tell process "Finder" to key code 19 using {control down}
delay 1
tell application "Trello" to activate
delay 7
tell application "System Events" to tell process "Trello"
	-- open "To Do" board
	keystroke "b"
	delay 0.1
	keystroke "To Do"
	delay 0.1
	key code 36 -- enter
	
	-- open new window
	key code 45 using {command down, shift down} -- cmd+shift+n
	delay 5
	
	-- open "Sphere" board
	keystroke "b"
	delay 0.1
	keystroke "Sphere"
	delay 0.1
	key code 36 -- enter
	
	-- open new window
	key code 45 using {command down, shift down} -- cmd+shift+n
	delay 5
	
	-- open "Research" board
	keystroke "b"
	delay 0.1
	keystroke "Research"
	delay 0.1
	key code 36 -- enter
	
	-- open new window
	key code 45 using {command down, shift down} -- cmd+shift+n
	delay 5
	
	-- open "Reading List" board
	keystroke "b"
	delay 0.1
	keystroke "Reading List"
	delay 0.1
	key code 36 -- enter
	
	-- open new window
	key code 45 using {command down, shift down} -- cmd+shift+n
	delay 5
	
	-- open "My Board" board
	keystroke "b"
	delay 0.1
	keystroke "My Board"
	delay 0.1
	key code 36 -- enter
end tell

-- Space 2 - communication
-- switch to space 2 (using ^3)
tell application "System Events" to tell process "Finder" to key code 20 using {control down}
delay 1
tell application "Signal" to activate
tell application "WhatsApp" to activate
tell application "Telegram" to activate
-- open Sphere in a Safari window
-- tell application "Safari" to activate
-- delay 1
-- https://stackoverflow.com/a/7016686
-- note that placing this and the previous Safari call into 1 tell block does not work
-- tell application "Safari" to set the URL of the front document to "https://beta.sphere.me"
-- Would love to open Slack thus:
-- tell application "Slack" to activate
-- but Slack is not a good citizen and opens on script load rather than when it is supposed to be executed
-- https://discussions.apple.com/thread/7778059
delay 1

-- Space 3 - Bear and Chrome
-- switch to space 3 (using ^4)
tell application "System Events" to tell process "Finder" to key code 21 using {control down}
delay 1
tell application "Bear" to activate
tell application "Google Chrome" to activate
delay 1

-- Space 4 - Sublime and iTerm
-- switch to space 4 (using ^5)
tell application "System Events" to tell process "Finder" to key code 23 using {control down}
delay 1
tell application "Sublime Text" to activate
tell application "iTerm"
	activate
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
delay 7

-- return to space 3
tell application "System Events" to tell process "Finder" to key code 21 using {control down}
