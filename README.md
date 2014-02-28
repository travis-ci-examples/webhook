An example webhook application using Sinatra to accept and process webhooks from Travis CI.

#### Run it on Heroku

1. Clone the repository
2. Create a Heroku app
3. Fetch your Travis CI user token from the profile page
3. Set the TRAVIS_USER_TOKEN environment variable on the Heroku app

Or, in direct commands:

1. git clone git://github.com/travis-ci/webhook-example.git
2. cd webhook-example
3. heroku create
4. heroku config:set TRAVIS_USER_TOKEN=<token>
5. git push heroku
