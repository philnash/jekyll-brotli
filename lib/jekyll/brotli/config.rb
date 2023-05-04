# frozen_string_literal: true

module Jekyll
  module Brotli
    DEFAULT_CONFIG = {
      'quality' => 11,
      'extensions' => [
        '.html',
        '.css',
        '.js',
        '.json',
        '.txt',
        '.ttf',
        '.atom',
        '.stl',
        '.xml',
        '.svg',
        '.eot'
      ].freeze
    }.freeze
  end
end
