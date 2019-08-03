require "image_matcher/version"
require "rmagick"

module ImageMatcher
  def self.image_diff(input_image, reference_image)
    pixel_arrays = Magick::Image.read(input_image, reference_image).map(&:export_pixels)
    input_image_pixels = pixel_arrays.first
    reference_image_pixels = pixel_arrays.second
    pixel_size = input_image_pixels.size

    pixel_size.each_with_object(0) do |i, diff|
      diff += ((input_image_pixels[i] - reference_image_pixels[i]).abs / 3)**2
    end

    Math.sqrt(diff / pixel_size)
  end

  def self.image_matches?(input_image, reference_image, threshold: 0)
    image_diff(input_image, reference_image) <= threshold
  end
end
