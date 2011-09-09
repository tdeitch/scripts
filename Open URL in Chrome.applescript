tell application "Google Chrome"
	if exists window 1 then
		set URL of (make new tab at end of tabs of window 1) to (the clipboard as text)
	else
		set URL of (make new tab at end of tabs of (make new window)) to (the clipboard as text)
	end if
	activate
end tell