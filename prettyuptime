uptime | \
sed s/^.*up// | \
awk -F, '{ if ( $3 ~ /user/ ) { print $1 $2 } else { print $1 }}' | \
sed 's/^ *//'
