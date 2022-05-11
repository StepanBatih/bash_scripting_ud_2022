#!/bin/bash

echo -e "1)Uptime: \n $(uptime) " 2>&1 >script3_Output.log
echo -e "2) Current users:\n $(users)" 2>&1 >>script3_Output.log
echo -e "3) Recent logins:\n $(last |head ) " 2>&1 >>script3_Output.log

topmem=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head) 
echo -e "4) TOP-10 processes by RAM/CPU usage:\n $topmem" 2>&1 >>script3_Output.log

openPorts=$(sudo netstat -tulpn | grep LISTEN)
echo -e "5) Open TCP/UDP ports:\n $openPorts" 2>&1 >>script3_Output.log

echo -e "6) Virtual Memory usage:\n $(vmstat)" 2>&1 >>script3_Output.log
echo -e "7) Usage of disk space:\n $(df -h)" 2>&1 >>script3_Output.log
