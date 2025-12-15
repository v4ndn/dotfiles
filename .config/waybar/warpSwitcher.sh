



if [ "$1" = "switch" ]; then
	if warp-cli status | grep -q "Connected"; then
		warp-cli disconnect
	else 
		warp-cli connect
	fi
else
	if warp-cli status | grep -q "Connected"; then
		echo "{\"tooltip\": \"Warp active\", \"class\": \"running\", \"text\": \"W ( \uf205 ) \"}"
	else 
		echo "{\"tooltip\": \"Warp disconnected\", \"class\": \"disabled\", \"text\": \"W ( \uf204 ) \"}"
	fi
fi