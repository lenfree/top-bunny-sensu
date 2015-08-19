# Top::Bunny::Sensu

There are two types Sensu checks. The popular one is publish and subscribe model
and the other one is external checks. External check results sends event data via
Sensu client socket. But what if my application is in a Docker container and I only
want one to run one process instead? Thanks to Ben who found the solution which
writes to RabbitMQ and we decided to make it a Ruby gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'top-bunny-sensu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install top-bunny-sensu

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/top-bunny-sensu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
