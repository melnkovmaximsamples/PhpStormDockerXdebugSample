Делал по гайдам:
- https://www.youtube.com/watch?v=xpdPG9R2kGA - настраивал docker + php + composer
- https://www.youtube.com/watch?v=5QrdFpxbkzA - настройка xDebug с докером

Как настраивать PhpStorm (в конце инструкция для hot-reload):

Сначала устанавливаем laravel в папку src. 
Перейти в докер docker exec -it [container-name] /bin/bash
Перейти в директорию /src
Команда composer create-project --prefer-dist laravel/laravel .
Далее по скриншотам прописать конфиги

Поставить все галочки как тут. Порт 9003 - это порт для xDebug 3-й версии

![image](https://user-images.githubusercontent.com/116734174/203286565-bee8c512-fadb-45a4-bbf0-ae7a12157b61.png)

Тут обязательно host.docker.internal как хост, название соответствующее. Не забыть прописать путь к src, как на скрине

![image](https://user-images.githubusercontent.com/116734174/203304361-4b084490-d6e0-42fa-a42a-9cd33bd12ec4.png)

Дебаг начинать по кнопке

![image](https://user-images.githubusercontent.com/116734174/203304531-7bcbd29c-8475-468b-ae81-97d76461e85e.png)

Тут проверять, есть ли ошибки

![image](https://user-images.githubusercontent.com/116734174/203304629-d846ad5a-ac3d-482d-b4f1-948a7ae31bf6.png)

===========================
Hot reload:
1. Устанавливаем laravel mix 'npm install laravel-mix --save-dev'
2. Устанавливаем blade reload extension 'npm i laravel-mix-blade-reload'
3. Устанавливаем browser sync 'npm install -g browser-sync'
4. Создаем файл в корне src с названием 'webpack.mix.js'
5. Добавляем следующие строки:

const mix = require('laravel-mix');

require('laravel-mix-blade-reload');

mix.js.bladeReload();

mix.browserSync({
    host: "localhost",
    proxy: 'localhost',
    open: false,
});
