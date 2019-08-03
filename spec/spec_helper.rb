require 'fileutils'
require "bundler/setup"
require "image_matcher"

SPEC_ROOT = File.dirname(__FILE__) + "/"
TEMP_DIR = SPEC_ROOT + "temp/"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    FileUtils.mkdir_p TEMP_DIR
  end

  config.after(:suite) do
    FileUtils.rm_rf TEMP_DIR
  end
end

def create_random_image(width: 100, height: 100, filename: 'tmp.bmp')
  data = Array.new(height) do
    Array.new(width) do
      [rand(255), rand(255), rand(255)]
    end
  end

  img = Magick::Image.new(width, height)

  data.each_with_index do |row, row_index|
    row.each_with_index do |item, column_index|
      img.pixel_color(row_index, column_index, "rgb(#{item.join(', ')})")
    end
  end

  img.write("#{TEMP_DIR}#{filename}")
end
