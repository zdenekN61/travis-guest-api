[![Build Status](https://travis-ci.org/AVGTechnologies/travis-guest-api.svg?branch=master)](https://travis-ci.org/AVGTechnologies/travis-guest-api) [![Code Climate](https://codeclimate.com/github/AVGTechnologies/travis-guest-api/badges/gpa.svg)](https://codeclimate.com/github/AVGTechnologies/travis-guest-api) [![Test Coverage](https://codeclimate.com/github/AVGTechnologies/travis-guest-api/badges/coverage.svg)](https://codeclimate.com/github/AVGTechnologies/travis-guest-api/coverage)

# Guest API

Service representing a bridge between Final-CI and test machines, by
processing the requests from VMs and taking the neccessary actions.

Covered functionality:
* test state notifications
* test step reporting
* log management

## Development

* checkout the repository
* create travis.yml based on example in config directory
* run `bundle install`
* run `rspec` to verify unit tests are passing

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/AVGTechnologies/travis-guest-api.

## License

The service is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
