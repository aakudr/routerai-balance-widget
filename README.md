# RouterAI Balance — виджет для AIO Launcher

Простой виджет, который показывает баланс на **RouterAI** на главном экране через [AIO Launcher](https://aiolauncher.app).

## Установка

1. Скопируйте файл `routerai_balance_widget.lua` в папку:
   ```
   /sdcard/Android/data/ru.execbit.aiolauncher/files/
   ```
2. Добавьте виджет **«RouterAI Balance»** на главный экран AIO Launcher.

## Настройка

1. **Нажмите на виджет** — откроется окно настроек.
2. Вставьте свой `Bearer`-токен от [routerai.ru](https://routerai.ru).
3. Готово! Виджет обновит баланс автоматически.

## Как это работает

- Виджет выполняет `GET`-запрос к `https://routerai.ru/api/v1/credits`.
- В заголовок `Authorization` подставляется ваш токен.
- В ответе достаётся число — и оно отображается на экране.

## Зависимости

- [AIO Launcher](https://aiolauncher.app) (скрипты Lua)
- Удобнее всего скопировать файл через [AIO список скриптов](https://github.com/zobnin/aiolauncher_scripts)

## Лицензия

MIT
