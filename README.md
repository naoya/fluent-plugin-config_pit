# fluent-plugin-config_pit

## ConfigPitInput, ConfigPitOutput

Fluentd Input/Output plugin which provides pit directive in configuration.

## Configuration

Fore both of input and output (for source and match), you can use 'pit' directive like below:

    <pit aws>
      type s3
      ...
      aws_key_id  $pit[aws_access_key]
      aws_seckey  $pit[aws_secret_access_key]
      ...
    </pit>

Variables '$pit[key]' will be replaced with values saved in ~/.pit directory by pit (https://github.com/cho45/pit). So you can safely treat API credentials or something like that.

## Copyright

* Copyright (c) 2013- Naoya Ito (@naoya_ito)
* License
  * Apache License, Version 2.0
  
## Installation

Add this line to your application's Gemfile:

    gem 'fluent-plugin-config-pit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-config-pit  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
