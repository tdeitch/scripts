tell application "Google Chrome"
	copy selection of active tab of first window
	set uri to URL of active tab of first window
	set tabtitle to title of active tab of first window
end tell

tell application "BBEdit"
	set wdw to (make new document)
	select insertion point after last character of wdw
	set selection to "Title: " & tabtitle & "
Author: 
Source: 
Date: 
URL: " & uri & "


"
	select insertion point after last character of wdw
	set selection to (the clipboard as text)
	set selection to (straighten quotes selection)
	select insertion point before first character of wdw
	activate
end tell