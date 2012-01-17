Short url token generator
=========================

Use to generate/decode tokens for urls

Install
-------

Just add this to your Gemfile:
  `gem 'short_url_token_generator'`

And run your bundler:
  `bundle install`

Usage
-----

pending

Example
-------

     `class Url < ActiveRecord::Base
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
      end`

License
-------

Copyright (C) 2012 Josemar Davi Luedke <josemarluedke@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.