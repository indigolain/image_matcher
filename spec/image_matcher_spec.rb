# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ImageMatcher do
  it 'has a version number' do
    expect(ImageMatcher::VERSION).not_to be nil
  end

  describe '.image_diff' do
    subject { ImageMatcher.image_diff(input_image_name, reference_image_name) }

    before { create_random_image(filename: file_name) }

    let(:file_name) { 'input_image.bmp' }
    let(:input_image_name) { TEMP_DIR + file_name }
    let(:reference_image_name) { TEMP_DIR + file_name }

    it { is_expected.to be <= 0 }
  end

  describe '.image_matches?' do
    subject do
      ImageMatcher.image_matches?(input_image_name, reference_image_name)
    end

    before { create_random_image(filename: file_name) }

    let(:file_name) { 'input_image.bmp' }
    let(:input_image_name) { TEMP_DIR + file_name }
    let(:reference_image_name) { TEMP_DIR + file_name }

    it { is_expected.to be true }
  end
end
