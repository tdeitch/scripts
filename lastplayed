# Replace "tdeitch" w/ your own last.fm username
# (unless you just want to keep track of what I'm listening to)

username="tdeitch"

curl --silent http://www.last.fm/user/$username \
| grep -A 4 '<tr class="first' \
| head -n 5 \
| tail -n 1 \
| sed 's/[ ]*<a href=".*">//g' \
| sed 's/<a href=".*" >//g' \
| sed 's/<\/a>//g' \
| sed 's/ <\/td>//g'
