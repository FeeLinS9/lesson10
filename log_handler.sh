#!/bin/bash

wget https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs
echo "Временной диапазон:"
cat apache_logs | awk '{print $4," "}' | sed "s/ /]/" | head -n 1 && date | awk '{print "[",$3,"/",$2,"/",$6,":",$4,"]"}' | sed "s/ //g" &&
echo "_______________________________________"

echo "Список IP адресов:"
cat apache_logs | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 10 > iplist.txt && cat iplist.txt &&
echo "_______________________________________"

echo "Список запрашиваемых URL:"
cat apache_logs | awk '{print $7}' | sort | uniq -c | sort -rn | head -n 10 > url_list.txt && cat url_list.txt &&
echo "_______________________________________"

echo "Ошибки веб-сервера:"
cat apache_logs | awk '{print $9}' | grep ^4 > error_list2.txt && cat apache_logs | awk '{print $9}'  | grep ^5 >> error_list2.txt && cat error_list2.txt | uniq -d -c | sort -rn > error_list.txt && cat error_list.txt &&
echo "_______________________________________"

echo "Список всех кодов HTTP:"
cat apache_logs | awk '{print $9}'| grep -v "-" | sort | uniq -c | sort -rn > status_code.txt && cat status_code.txt && 
echo "_______________________________________"

rm -rf iplist.txt url_list.txt error_list2.txt error_list.txt status_code.txt