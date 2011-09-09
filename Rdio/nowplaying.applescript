if application "Rdio" is running then
	tell application "Rdio" to return the artist of the current track & " - " & the name of the current track & " "
else
	set hostname to do shell script "/bin/hostname"
	return hostname & " "
end if
