#!/bin/bash

echo "Enter the service name in format ***.service: "  
read service_name 
#small checking is a correct name of service ?
checking_service=$(systemctl is-enabled $service_name)
if [[ $checking_service != "enabled" ]]
then
echo "ERROR INCORRECT SERVICE NAME "
exit 1
fi

echo "The current checking Service is $service_name"

is_active=$(systemctl is-active $service_name)

if [ $is_active == "active" ]
then
echo "$service_name is  ACTIVE(runnig)"
else 
echo "$service_name is inactive(not runnig)"
fi

if [ $is_active == "inactive" ]
then
echo "Run this service : yes or no ?"
fi

read usr_confirmation

if [[ $usr_confirmation == "yes" && $is_active == "inactive" ]]
then
service_start= echo -e "$service_name now is RUNNIG  $(systemctl start $service_name)"
elif [[ $usr_confirmation != "yes" && $is_active == "inactive" ]]
then
echo "Ok $service_name still not running"
fi

