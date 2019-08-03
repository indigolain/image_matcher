# frozen_string_literal: true

require 'image_matcher/version'
require 'rmagick'

module ImageMatcher # :nodoc:
  def self.image_diff(input_image_name, reference_image_name)
    input_image_pixels = Magick::Image.read(input_image_name).first
                                      .export_pixels
    reference_image_pixels = Magick::Image.read(reference_image_name).first
                                          .export_pixels
    pixel_size = input_image_pixels.size
    accumulated = pixel_size.times.inject(0) do |diff, i|
      diff += ((input_image_pixels[i] - reference_image_pixels[i]).abs / 3)**2
      diff
    end
    Math.sqrt(accumulated / pixel_size)
  end

  def self.image_matches?(input_image, reference_image, threshold: 0)
    image_diff(input_image, reference_image) <= threshold
  end
end
