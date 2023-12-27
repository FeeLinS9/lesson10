#!/bin/bash
bash log_handler.sh > mail.txt &&
mailx otus@localhost < mail.txt &&
rm -f mail.txt apache_logs