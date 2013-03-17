# Want to create QR codes and measure how they're used?

Fork/Clone this repo - then:
    
    bundle install
    heroku create $APP_NAME
    heroku addons:add redistogo
    rake secret
    heroku config:add SESSION_SECRET="the-output-of-the-last-command"
    git push heroku master
    heroku run rake dm:migrate
    heroku run rake seed
    heroku open

* Create a "redirect" in /admin/.
* Click on the "Show" link for a redirect and grab the generated QR Code.
* Scan the QR Code - that logs a simple counter in Redis.

Take a look at this example QR Code:

![Scan me.](https://raw.github.com/darron/reflector/master/example.png)

## Clients can create their own QR Codes and they get logged when they're used.

## TODO - patches welcome: 

* Multiple users with access to different QRCodes.
* More granular daily stats - sparklines - logging but not displayed.
* to_i(36) - for better randomness for the urls.

But it's working great and seems to do the trick for today.