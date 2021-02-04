# frozen_string_literal: true

module Jekyll
  module Brotli
    DEFAULT_CONFIG = {
      'extensions' => [
        '.html',
        '.css',
        '.js',
        '.txt',
        '.ttf',
        '.atom',
        '.stl',
        '.xml',
        '.svg',
        '.eot',
        '.json'
      ].freeze
    }.freeze
  end
end
