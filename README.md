# Semaphore [![Build Status](https://secure.travis-ci.org/NOX73/semaphore.png)](http://travis-ci.org/NOX73/semaphore)

Semaphore implementation for ruby

## Installation

Add this line to your application's Gemfile:

    gem 'semaphore'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install semaphore

## Usage

```ruby
semaphore = Semaphore.new 2

semaphore.synchronize {
    # your code
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
