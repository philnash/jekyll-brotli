# Jekyll::Brotli

Generate compressed assets and files for your Jekyll site at build time using [Brotli](https://github.com/google/brotli) compression.

[![Gem Version](https://badge.fury.io/rb/jekyll-brotli.svg)](https://rubygems.org/gems/jekyll-brotli) [![Build status](https://github.com/philnash/jekyll-brotli/workflows/tests/badge.svg)](https://github.com/philnash/jekyll-brotli/actions) [![Maintainability](https://api.codeclimate.com/v1/badges/9deb43d992a0c47a55e4/maintainability)](https://codeclimate.com/github/philnash/jekyll-brotli/maintainability) [![Inline docs](https://inch-ci.org/github/philnash/jekyll-brotli.svg?branch=master)](https://inch-ci.org/github/philnash/jekyll-brotli)

[API docs](http://www.rubydoc.info/gems/jekyll-brotli/) | [GitHub repo](https://github.com/philnash/jekyll-brotli)

## Why?

Performance in web applications is important. You know that, which is why you have created a static site using Jekyll. But you want a bit more performance. You're serving your assets and files gzipped, but could it be better?

Google's Brotli compressor is a new format with better compression than Zlib's gzip or Zopfli and is supported in [all major modern browsers](https://caniuse.com/#feat=brotli). Compressing files at build time means you can use the highest compression levels with no penalty for dynamically generating the files, so if you're building your site with Jekyll, why not generate the files at the same time?

`Jekyll::Brotli` does just that. Add the gem to your Jekyll application and when you build your site it will generate brotli files for all text based files (HTML, CSS, JavaScript, etc).

### Warning

Brotli is not supported everywhere, so you may want to also gzip your files too. Check out [`Jekyll::Gzip`](https://github.com/philnash/jekyll-gzip) and [`Jekyll::Zopfli`](https://github.com/philnash/jekyll-zopfli) for options there.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-brotli'
```

And then execute:

```
bundle install
```

## Usage

Once you have the gem installed, run `JEKYLL_ENV=production bundle exec jekyll build`. In your destination directory (`_site` by default) you will find brotli files.

Jekyll::Brotli only runs when the environment variable `JEKYLL_ENV` is set to `production` as dealing with compressing files is unnecessary in development mode and just slows down the site build.

### Serving pre-compiled gzip files

You will likely need to adjust your web server config to serve these precomputed gzip files. See below for common server configurations:

#### nginx

For nginx, you need to compile nginx with Google's `ngx_brotli` module. Follow [the steps in this blog post](https://ethitter.com/2016/12/adding-brotli-support-to-nginx/) for more detail.

#### Other web servers

TODO: instructions for other web servers like Apache, HAProxy, etc.

Do you know how to do this for a different server? Please open a [pull request](https://github.com/philnash/jekyll-brotli/pulls) or an [issue](https://github.com/philnash/jekyll-brotli/issues) with the details!

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/philnash/jekyll-brotli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Brotli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/philnash/jekyll-gzip/blob/master/CODE_OF_CONDUCT.md).
