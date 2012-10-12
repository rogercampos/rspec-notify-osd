# Rspec::Notify::Osd

This is a port of [rspec-nc](https://github.com/twe4ked/rspec-nc) to the
Ubuntu's notify-osd notification system. It simly uses the `notify-send`
binary to display notifications.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-notify-osd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-notify-osd

## Usage

You need to use a new formatter with rspec, the recommended way is to add this
line into your `.rspec` file:

    --format NotifyOsd

This formatter needs to be used along with some other, as it does not provide
any kind of visual output. Your `.rspec` file should look like this:

    --format progress
    --format NotifyOsd
    --color


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
