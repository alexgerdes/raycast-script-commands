#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Safari Profile
# @raycast.mode silent

# Optional parameters:
# @raycast.icon images/safari.png
# @raycast.packageName Safari
# @raycast.argument1 { "type": "text", "placeholder": "profile", "optional": true }

# Documentation:
# @raycast.description Open Safari with a given profile (default is Personal).
# @raycast.author Alex Gerdes
# @raycast.authorURL http://www.botkes.nl

on run argv
	tell application "Safari" to activate

	set profile to "Personal"

	if (count of argv) > 0 then
		if item 1 of argv is not "" then
			set profile to item 1 of argv
		end if
	end if

	set menuItem to "New " & profile & " Window"

	tell application "System Events"
		tell process "Safari"
			click menu item menuItem of menu 1 of menu item "New Window" of menu "File" of menu bar 1
		end tell
	end tell
end run
