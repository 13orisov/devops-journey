## HTTPS (19.10.2026)
- Сертификат Let's Encrypt через certbot (плагин nginx) для домена и www,
редирект http → https (301).
- Автопродление: systemd-таймер certbot.timer,
`
проверено
certbot renew --dry-run
`
.
- /etc/letsencrypt добавлен в ночной бэкап.
### Что сломалось и как починил
- Тестовый выпуск падал с
`
unauthorized … reader size limit exceeded`
на IPv6-адресе. NS Timeweb отдавали для домена скрытую AAAA на свой
хостинг — в панели её не было. Let's Encrypt сначала идёт по IPv6,
поэтому проверка уходила не на мой сервер.
- Нашёл через
`dig AAAA … @ns1.timeweb.ru
`
: проверял DNS напрямую у NS,
а не по панели. Добавил свою AAAA на IPv6 сервера, написал в поддержку —
после исправления выпуск прошёл.
`
-
nginx -t`
поймал опечатку в
`
server
`
name
до перезагрузки.
_
Проверяю конфиг перед каждым reload.
