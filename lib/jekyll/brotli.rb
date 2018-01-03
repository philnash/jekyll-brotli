require "jekyll/brotli/version"
require "jekyll/brotli/compressor"

module Jekyll
  module Brotli
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  if ENV["JEKYLL_ENV"] == "production"
    Jekyll::Brotli::Compressor.new(site).compress
  end
end