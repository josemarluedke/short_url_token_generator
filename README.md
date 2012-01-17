Short url token generator
=========================

Use to generate/decode tokens for urls

Install
-------

Just add this to your Gemfile:
  `gem 'short_url_token_generator'` (not yet published in RubyGems.org)

And run your bundler:
  `bundle install`

Usage
-----

pending

Example
-------

    class Url < ActiveRecord::Base
        before_create do
          if self.token.nil? or self.token.empty?
            self.token = generate_token Url.count(conditions: {:custom => false})
          else
            self.custom = true
          end
        end
      private
        def generate_token num
          token = ShortUrlTokenGenerator::generate num
          if Url.count(conditions: {:token => token}) > 0
            token = generate_token num + 1
          end
          token
        end
    end

License
-------

Copyright (C) 2012 Josemar Davi Luedke <josemarluedke@gmail.com> released under the MIT license