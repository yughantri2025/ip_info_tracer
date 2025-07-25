#!/bin/bash
#
echo " ip geolocation tracker (kali) "
echo "=============================="
read -p " enter ip address to track: " ip 
if [[ -z "$ip " ]] ; then
	echo " no ip address enterd. exiting."
	exit 1
fi
echo " " 
echo " tracking your $ip "
echo "====================="
responce=$(curl -s https:ipinfo.io/$ip/json)
status=$(echo $responces | grep -o '"status":"[^"]*'| cut -d':' -f2 | tr -d "")
if [ "$status"! ="success" ]; then
	echo "[!] failed to fetch data . check ip or network."
	exit 1
	fi
echo "  "
echo "[1] display ip "
echo " [2] display country "
echo "[3] display city"
echo " [4] dislpay hostname "
echo " [5] dislpay region "
echo "[6] display loc "
echo "[7] display org"
echo "[8] display postal "
echo "[9] display timezone "
echo "[10] display readme "
echo "[11] display anycast"
read no
if [ $no == 1 ]; then 
	#echo "ip address: $(echo $responce |  grep -o '"query":"[^"]*' | awk '{print $2}' cut -d':' -f2 | tr -d '"')"
	curl ipinfo.io/8.8.8.8/json | grep 8.8.8.8
elif [ $no == 2 ]; then
	#echo " country :$(echo $responce | grep -o '"country":"[^"]*' | awk '{print $2}'cut -d':' -f2 | tr -d '"')"
	curl ipinfo.io/8.8.8.8/json | grep country
elif [ $no == 3 ]; then 
	#echo " city :$(echo $respone | grep -o '"city ":"[^"]*' | awk '{print $2}' cut -d':' -f2 | tr -d '"')"
	curl ipinfo.io/8.8.8.8/json | grep city
elif [ $no == 4 ]; then
	#echo " hostnsme : $( echo $responce | grep -o '" hostname ":"[^"]*' | awk '{print $2}' cut -d ':' -f2 | tr -d '"')"
	curl ipinfo.io/8.8.8.8/json | grep hostname
elif [ $no == 5 ]; then 
	# echo " region : $(echo $responce | grep -o '" region ":"[^"]*' | awk '{print $2}' cut -d ':' -f2 | tr -d '"')"
	curl ipinfo.io/8.8.8.8/json | grep region 
elif [ $no == 6 ]; then
       # echo " loc : $(echo $responce | grep -o '" loc ":" loc ":"[^"]*' | awk '{print $2}' cut -d ':' -f2 | tr -d '"')"
       curl ipinfo.io/8.8.8.8/json | grep loc
elif [ $no == 7 ]; then 
      curl ipinfo.io/8.8.8.8/json | grep org
elif [ $no == 8 ]; then 
      curl ipinfo.io/8.8.8.8/json | grep postal 
elif [ $no == 9 ]; then 
     curl ipinfo.io/8.8.8.8/json | grep timezone 
elif [ $no == 10 ]; then
     curl ipinfo.io/8.8.8.8/json | grep readme 
elif [ $no == 11 ]; then
     curl ipinfo.io/8.8.8.8/json | grep anycast

else
	echo " wrong option selected "
fi
