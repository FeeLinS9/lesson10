# BASH
## Написать скрипт для CRON, который раз в час будет формировать письмо и отправлять на заданную почту.

Необходимая информация в письме:

- Список IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;\
- Список запрашиваемых URL (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;\
- Ошибки веб-сервера/приложения c момента последнего запуска;
Список всех кодов HTTP ответа с указанием их кол-ва с момента последнего запуска скрипта.

Скрипт должен предотвращать одновременный запуск нескольких копий, до его завершения.

В письме должен быть прописан обрабатываемый временной диапазон.

log_handler.sh - копирует в домашний каталог лог (apache_logs) и анализирует его.
send_mail.sh - создаёт отчёт с помощью log_handler.sh и отправляет его на заданную почту.
0send_mail.cron - задание для cron.\
\
log_handler.sh и send_mail.sh должны лежать в /root/, 0send_mail.cron в /etc/cron.hourly/ и быть исполняемым.