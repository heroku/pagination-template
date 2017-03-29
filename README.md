# Pagination Example Template

### Setup

```
git clone https://github.com/heroku/pagination-template
bundle
rake db:setup
```

The code implies you have Postgres database installed. By default
`pagination-starter-development` and `pagination-starter-test` databases will
be created and used for development/test environments. You can override the
database URL per environment by creating a `.env.<environment>` file with
`DATABASE_URL` in it. For example, if you want you database to be called
`my-test-db` in test environment, create a .env.test file with the following
content:

```
DATABASE_URL=postgres://localhost/my-test-db
```

Using Postgres is not mandatory. Feel free to make necessary changes to run a
different database.

### Run Tests

```
bundle exec rake
```

## Start the webserver

```
bin/web
```

### Pagination

The codebase has one model called Thing that has an integer id and a text name.
There's also an endpoint called `API::Endpoints::Things` that is mounted under
`/things` namespace. The endpoint renders all existing Thing records from the
database.

TODO: describe how pagination should work.
