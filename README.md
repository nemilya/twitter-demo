Twitter Demo
============

Демо приложение для поста в Твиттер.

Demo: http://twitter-demo.cloudfoundry.com/

* [step 1](https://github.com/nemilya/twitter-demo/commit/e3ad976c6297f1d6401fc8f05480dc1a4603dbf0)
* [step 2](https://github.com/nemilya/twitter-demo/commit/8fbcfc212313a063c2f332f027bc2a7b5743df99)
* [step 3](https://github.com/nemilya/twitter-demo/commit/a777141b49e61d0f4b87815f198df80b2c226fe9)

Технологии
----------

* [Ruby](http://ruby-lang.org) - язык программирования Ruby
* [CloudFoundry](http://cloudfoundry.com/) - быстрое развёртывание Ruby приложений
* [Sinatra](http://sinatraruby.ru/) - минималистичный веб фреймворк на Ruby
* [omniauth](https://github.com/intridea/omniauth) - универсальная система авторизации
* gem [omniauth-twitter](https://github.com/arunagw/omniauth-twitter) - стратегия для OmniAuth для авторизации в Twitter
* gem [twitter](https://github.com/jnunemaker/twitter) - Ruby обёртка для API функций Twitter



Первый шаг (step1)
------------------

[Посмотреть изменения](https://github.com/nemilya/twitter-demo/commit/e3ad976c6297f1d6401fc8f05480dc1a4603dbf0)


Разработка "каркаса" приложения.

Синатра приложение, с логин/выход, отображение когда "вошёл" - формы поста,
обработка поста, редирект, отображение подтверждение.

Размещение на CloudFoundry

    vmc push twitter-demo

Размещение на GitHub

Время: 25 минут.


Шаг второй (step2)
------------------

[Посмотреть изменения](https://github.com/nemilya/twitter-demo/commit/8fbcfc212313a063c2f332f027bc2a7b5743df99)

Создание твиттер приложения. Авторизация.

Заходим в раздел разработчиков https://dev.twitter.com, создаём приложение.

Указываем название, описание, урл http://twitter-demo.cloudfoundry.com

Права указываем `Read and Write`. Обратный урл для этого приложение - 
указываем на http://twitter-demo.cloudfoundry.com/auth/twitter/callback

Получаем `Consumer key` и `Consumer secret`


Добавление omniauth авторизации.

Прописываем ключ и секрет в yml файл - `config/oauth.yml`

Добавляем в Gemfile - гем `omniauth-twitter`.

Делаем "упаковку" гемов - 

    bundle package

Создаётся папка `vendor` - в ней сохраняются все используемые гемы. Это 
необходимо при развёртывании на CloudFoundry.

Добавление обработки колбэка от twitter, получение токена и секретного токена.


Обновляем код на CloudFoundry командой:

    vmc update twitter-demo


Шаг третий (step3)
------------------

[Посмотреть изменения](https://github.com/nemilya/twitter-demo/commit/a777141b49e61d0f4b87815f198df80b2c226fe9)

Пост сообщения на стену твиттер аккаунта.

Добавление твиттер враппера для API.

Используем https://github.com/jnunemaker/twitter

Инициализируем.

Выполняем API:

    Twitter.update(...)



Обновляем на сервере:

    vmc update twitter-demo

Заходим, авторизуемся, пишем текст, отправляем форму. Смотрим на свою стену.

