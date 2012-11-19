# Backdoor

Test your app from end to end, mobile client to backend API.

`backdoor` is a simple server that exposes your backend factories (Factory Girl, Machinist) to your API client test suite.

## How it works

### Example workflow - Test user signin from your mobile API client

1. connect to `backdoor`
2. create a User on the backend using the user factory
3. test the REST API call for user signin
4. tell the backend to clean the database

Rinse, repeat for the next tests.

## Architecture

    |-----------------------|          |--------------|-----------|
    | API client test suite | =======> | backdoor API | Rails app |
    | (ex.: SenTest)        |          |--------------|           |
    |                       |                         |           |
    |                       |          |--------------|           |
    |-----------------------| =======> | REST API     |           |
                                       |--------------|-----------|

## Security warning

The name of the project has a real meaning. It really creates a backdoor to your backend!
It is simple and powerful, but use it with caution.

Simple rule to stay safe: ** Never install it in production **.

See [Installation](#installation).

## Requirements

* Rails
* [Database Cleaner](https://github.com/bmabey/database_cleaner)

## Installation

Add this line to your application's Gemfile:

    group :test do
      gem 'backdoor'
    end

As noted in the *Security warning*, you should never install it in production. Keep it in the test environment.

Make sure your production deployment strategy installs your app bundle without the `test` gems. `bundle install --without=test`. Heroku and Capistrano should have this behaviour by default.

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backdoor

## Usage

Start the `backdoor` server.

## Backdoor clients

Existing clients:
* iOS: [backdoor-ios](http://github.com/lakim/backdoor-ios)
* Android, others: please [contribute](#contributing)!

### Protocol

`backdoor` is a TCP server with a very basic protocol. It has only ONE specific request!

* `clean`: asks the backend to put the DB back to a clean state
* every other request is interpreted as Ruby code on your backend (hence the security concerns, you guessed it)

## TODO

* Document the workflow to start backdoor and the rails test server
* Make `backdoor` backend agnostic (no Rails dependency)

## Contributing

### Contributing to backdoor

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Create a client

1. Create an awesome client for your platform (Android, Javascript, you name it)
2. Send me a request so I can link to your client here!