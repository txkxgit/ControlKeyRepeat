###################################################
# Control Key Repeat
# 
# Enables/Disables macOS Key Repeat
#
# 2019-03-19
# Timo Kahle
#
#
# Changes
#
# v1.0 (2019-03-19)
# -Initial version
#
###################################################

# Properties
property appIcon : "applet.icns"
property appName : "ControlKeyRepeat"
property appVersion : "1.0"
property dlgText : "Enable or Disable Press And Hold."

property CMD_EnablePressAndHold : "defaults write -g ApplePressAndHoldEnabled -bool true"
property CMD_DisablePressAndHold : "defaults write -g ApplePressAndHoldEnabled -bool false"
###################################################

# Main
on run
	# Set resources
	set applicationIcon to (path to resource appIcon)
	set dlgTitle to appName & " (" & appVersion & ")"
	
	# User interaction
	set myAnswer to display dialog dlgText with title dlgTitle buttons {"Cancel", "Press And Hold", "Key Repeat"} default button {"Press And Hold"} cancel button "Cancel" with icon applicationIcon
	set myResult to button returned of myAnswer
	
	# Call change function
	changeFlag(myResult)
	
end run


# Apply the changes
on changeFlag(myState)
	if myState = "Press And Hold" then
		do shell script CMD_EnablePressAndHold
	else
		do shell script CMD_DisablePressAndHold
	end if
end changeFlag