require "image_matcher/version"
require "rmagick"

module ImageMatcher
  def self.image_diff(input_image_name, reference_image_name)
    input_image_pixels = Magick::Image.read(input_image_name).first.export_pixels
    reference_image_pixels = Magick::Image.read(reference_image_name).first.export_pixels
    pixel_size = input_image_pixels.size

    diff = pixel_size.times.each_with_object(0) do |i, diff|
      diff += ((input_image_pixels[i] - reference_image_pixels[i]).abs / 3)**2
    end

    Math.sqrt(diff / pixel_size)
  end

  def self.image_matches?(input_image, reference_image, threshold: 0)
    image_diff(input_image, reference_image) <= threshold
  end
end
