require "brotli"

module Jekyll
  module Brotli
    class Compressor
      COMPRESSABLE_EXTENSIONS = [
        '.html',
        '.css',
        '.js',
        '.txt',
        '.ttf',
        '.atom',
        '.stl',
        '.xml',
        '.svg',
        '.eot'
      ]

      attr_reader :site

      def initialize(site)
        @site = site
      end

      def compress_file(file_name)
        return unless COMPRESSABLE_EXTENSIONS.include?(File.extname(file_name))
        compressed = "#{file_name}.br"
        contents = ::Brotli.deflate(File.read(file_name), quality: 11)
        File.open(compressed, "w+") do |file|
          file << contents
        end
        File.utime(File.atime(file_name), File.mtime(file_name), compressed)
      end

      def compress
        site.each_site_file do |file|
          compress_file(file.destination(site.dest))
        end
      end
    end
  end
end 