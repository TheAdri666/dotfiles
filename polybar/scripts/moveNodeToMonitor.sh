QUERY_MONITOR=$(sh -c 'bspc query -D | nl | grep $(bspc query -D --desktop focused) | cut -f1 | xargs')

while [ "$QUERY_MONITOR" -gt 10 ]; do
	QUERY_MONITOR=$(($QUERY_MONITOR - 10))
done

bspc node -d "^$1:^$QUERY_MONITOR" --follow
