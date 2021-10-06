Собрана связка prometheus + blackbox + grafana. 

Для удобства вынесено в отдельный репозиторий - https://github.com/aturubanov/prometheus

Для того, чтобы запустить (предполагаем, что уже установлены git и docker compose)

-клонируем репозиторий в текущую директорию 

`git clone https://github.com/aturubanov/prometheus.`

-запускаем

`docker compose up -d`

В результате по адресу http://localhost:3000 будет доступен вебинтерфейс grafana. Логин admin, пароль admin. Среди dashboard выбираем Blackbox Exporter.
