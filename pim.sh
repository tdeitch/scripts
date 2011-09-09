echo "
Calendar
--------"
icalBuddy eventsToday+7
echo "

Todo list
---------"
todo ls `date +%m%d`
echo "
"
