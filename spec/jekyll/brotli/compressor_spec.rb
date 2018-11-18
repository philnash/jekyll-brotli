require "zlib"
require "./lib/jekyll/brotli/compressor"

RSpec.describe Jekyll::Brotli::Compressor do
  let(:site) { make_site }
  before(:each) { site.process }
  after(:each) { FileUtils.rm_r(dest_dir) }

  describe "given a file name" do
    it "creates a brotli file" do
      file_name = dest_dir("index.html")
      Jekyll::Brotli::Compressor.compress_file(file_name, ['.html'])
      expect(File.exist?("#{file_name}.br")).to be true
    end

    it "doesn't create a br file if the extension is not present" do
      file_name = dest_dir("index.html")
      Jekyll::Brotli::Compressor.compress_file(file_name, [])
      expect(File.exist?("#{file_name}.br")).to be false
    end

    it "creates a br file that is smaller than zlib gzip file" do
      file_name = dest_dir("index.html")
      Jekyll::Brotli::Compressor.compress_file(file_name, ['.html'])
      zlib_file = dest_dir("zlib-index.html.gz")
      Zlib::GzipWriter.open(zlib_file, Zlib::BEST_COMPRESSION) do |gz|
        gz.mtime = File.mtime(file_name)
        gz.orig_name = file_name
        gz.write IO.binread(file_name)
      end
      expect(File.stat("#{file_name}.br").size).to be < File.stat(zlib_file).size
    end

    it "compresses the content of the file in the brotli file" do
      file_name = dest_dir("index.html")
      Jekyll::Brotli::Compressor.compress_file(file_name, ['.html'])
      content = File.read(file_name)

      Brotli.inflate(File.read("#{file_name}.br")) { |br|
        expect(br.read).to eq(content)
      }
    end

    it "doesn't compress non text files" do
      file_name = dest_dir("images/test.png")
      Jekyll::Brotli::Compressor.compress_file(file_name, ['.html'])
      expect(File.exist?("#{file_name}.br")).to be false
    end

    describe "given a Jekyll site" do
      it "compresses all files in the site" do
        Jekyll::Brotli::Compressor.compress_site(site)
        files = [
          dest_dir("index.html"),
          dest_dir("css/main.css"),
          dest_dir("about/index.html"),
          dest_dir("jekyll/update/2018/01/01/welcome-to-jekyll.htlm"),
          dest_dir("feed.xml")
        ]
        files.each do |file_name|
          expect(File.exist?("#{file_name}.br"))
        end
      end

      describe "given a destination directory" do
        it "compresses all the text files in the directory" do
          Jekyll::Brotli::Compressor.compress_directory(dest_dir, site)
          files = [
            dest_dir("index.html"),
            dest_dir("css/main.css"),
            dest_dir("about/index.html"),
            dest_dir("jekyll/update/2018/01/01/welcome-to-jekyll.htlm"),
            dest_dir("feed.xml")
          ]
          files.each do |file_name|
            expect(File.exist?("#{file_name}.br"))
          end
        end
      end
    end
  end
end