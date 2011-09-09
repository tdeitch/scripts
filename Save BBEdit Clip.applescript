tell application "BBEdit"
	tell first document
		set source to characters 9 thru -1 of line 3
		set article to characters 8 thru -1 of line 1
		set filepath to "Macintosh HD:Users:trey:Documents:clips:" & source & " - " & article & ".txt"
		save to filepath
	end tell
end tell