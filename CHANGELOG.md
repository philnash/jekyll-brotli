# Changelog

## Ongoing [☰](https://github.com/philnash/jekyll-brotli/compare/v2.0.0...master)

...

## 2.1.0 (2018-11-24) [☰](https://github.com/philnash/jekyll-brotli/compare/v2.0.0...v2.1.0)

### Changed

- Opens up version support for Jekyll 4 (thanks [@thedanbob](https://github.com/thedanbob))

## 2.0.0 (2018-11-24) [☰](https://github.com/philnash/jekyll-brotli/compare/v1.0.0...v2.0.0)

### Added

- Adds frozen string literal comments
- Tries to hook into Jekyll::Assets if available

### Changed

- Uses built in `Jekyll.env` instead of `ENV["JEKYLL_ENV"]`
- Changes `Jekyll::Brotli::Compressor` to a module and implements a `compress_directory` method
- Moves Jekyll::Brotli::COMPRESSABLE_EXTENSIONS into plugin config that can overwritten in the site config

## 1.0.0 (2018-01-03) [☰](https://github.com/philnash/jekyll-brotli/commits/v1.0.0)

### Added

- Methods to Gzip compress text files throughout a Jekyll site using Brotli
- Site post write hook to trigger compression
