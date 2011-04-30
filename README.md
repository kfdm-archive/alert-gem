# alert

"Alert" provides cross platform notification functionality using a variety of
notification drivers

## Features
 * Email
 * Growl (using gntp)
 * Prowl
 * Campfire

## Command

By default reads its configuration information from `~/.alertrc` so running 
alert is as simple as a simple command

`% alert This is an important message`

Specific drivers can also be used via flags

`% alert --email --prowl This is an important message`

## Library

    require 'alert'
    Alert.notify "This is an important message"

## Configuration

The configuration file is a simple yml document with the parent node names
corresponding to the driver name

    ---
    email:
      addresses:
        - person@example.com
        - another_person@example.com
    prowl:
      apikey: 0123456789
    campfire:
      username: campfireuser
      password: securepassword
        

## Inspiration

 * [Notifier](https://github.com/fnando/notifier)
 * [Notify](https://github.com/jugyo/notify)
