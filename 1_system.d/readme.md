На входе скрипту передается строка с путем, по которому располагается файл сервера.

Например:
`./sd_unit.sh ./system.d/server.py`

Скрипт проверяет:
- отсутствие данных на входе 
- отсутсвие python3 в системе

Далее разбирает полученную строку и на основе этого делает system.d юнит, добавляет его в автозагрузку и стратует.
