Twitter Demo
============

Демо приложение для поста в Твиттер.

Дема здесь: http://twitter-demo.cloudfoundry.com/

Первый шаг:

Синатра приложение, с логин/выход, отображение когда "вошёл" - формы поста,
обработка поста, редирект, отображение подтверждение.

Размещение на CloudFoundry

  vmc push twitter-demo

Размещение на GitHub

Время: 25 минут.


Шаг второй:

Создание твиттер приложения.

Заходим в раздел разработчиков https://dev.twitter.com, создаём приложение.

Указываем название, описание, урл http://twitter-demo.cloudfoundry.com

Права указываем `Read and Write`. Обратный урл для этого приложение - 
указываем на http://twitter-demo.cloudfoundry.com/auth/twitter/callback

Получаем `Consumer key` и `Consumer secret`


Добавление omniauth авторизации.

Прописываем ключ и секрет в yml файл - config/oauth.yml

Добавляем в Gemfile - гем `omniauth-twitter`.

Делаем "упаковку" гемов - 

    bundle package

Создаётся папка `vendor` - в ней сохраняются все используемые гемы. Это 
необходимо при развёртывании на CloudFoundry.

Добавление обработки колбэка от twitter, получение токена и секретного токена.


Обновляем код на CloudFoundry командой:

  vmc update twitter-demo




Шаг третий:

Добавление твиттер враппера для API.

Пост сообщения на стену твиттер аккаунта.

