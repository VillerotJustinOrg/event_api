# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.2.2

* Rails version 7.1.2

* initialization of the project and dependencies instalation

```bash
$ sudo apt-get install sqlite3 libsqlite3-dev
$ gem install bundler
$ gem update bundler
$ bundle install --without db
```

* Database initialization

```bash
rail db:migrate
```

* Route

There is a postman collection in the last release