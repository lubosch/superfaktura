[![Build Status](https://travis-ci.com/lubosch/superfaktura.svg?branch=master)](https://travis-ci.com/lubosch/superfaktura)
[![Coverage Status](https://codecov.io/gh/lubosch/superfaktura/branch/master/graph/badge.svg)](https://codecov.io/gh/lubosch/superfaktura)
# Superfaktura

Gem for easy integration with http://superfaktura.sk/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'superfaktura'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install superfaktura

## Configuration

```
Superfaktura.configure do |config|
  config.email = Rails.application.config_for(:superfaktura)[:email]
  config.token = Rails.application.config_for(:superfaktura)[:token]
end
```

Initialize `exponea.rb` with this settings:
- **email**: login email to superfaktura
- **token**: token generated from superfaktura

## Usage

### Create invoice
```
Superfaktura::Invoices.create(attributes)
```
- **attributes**: hash for adding invoice. More info here: https://github.com/superfaktura/docs/blob/master/invoice.md#add-invoice

### Download invoice
```
Superfaktura::Invoices.download(id, locale: :en)
```
- **id**: superfaktura id
- **locale**: locale, iso2. More info in Superfaktura::Locales::LANGUAGES

### Check connection
```
Superfaktura::CheckConnection.call : Boolean
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/superfaktura.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
