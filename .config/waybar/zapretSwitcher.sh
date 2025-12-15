status="$(sshpass -p \!Luda1973 ssh root@192.168.1.1 "service zapret status")"

if [ "$status" = "running" ]; then
	echo "{\"tooltip\": \"$status\", \"class\": \"$status\", \"text\": \"Z ( \uf205 ) \"}"

else
	echo "{\"tooltip\": \"$status\", \"class\": \"$status\", \"text\": \"Z ( \uf204 ) \"}"
fi



if [ "$1" = "switch" ]; then
	if [ "$status" = "inactive" ]; then
		sshpass -p !Luda1973 ssh root@192.168.1.1 service zapret start
	else 
		sshpass -p !Luda1973 ssh root@192.168.1.1 service zapret stop
	fi
fi
