# Want to create QR codes and measure how they're used?

* Install Reflector. (Needs Ruby, Padrino, MySQL and Redis)
* Setup Capistrano settings in config/deploy.rb
* Setup your DB in config/database.rb
* Setup your Redis installation in config/redis.yml
* Setup your admin account in db/seeds.rb
* `cap deploy` - should install all gems if you have bundler on the server.
* Migrate and seed on the server.

    `padrino rake dm:migrate`
    
    `padrino rake seed`

* Create a "redirect" in /admin/.
* Click on the "Show" link for a redirect and grab the generated QR Code.
* Scan the QR Code - that logs a simple counter in Redis.

##Clients can create their own QR Codes and they get logged when they're used.

## TODO - patches welcome: 

* REDIS_NAMESPACE so we can run multiple installations in the same db.
* Multiple users with different QRCodes.
* More granular daily stats - sparklines - logging but not displayed.
* to_i(36) - for better randomness for the urls.

But it's working great and seems to do the trick for today.