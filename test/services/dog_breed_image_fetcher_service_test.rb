# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DogBreedImageFetcherService, type: :service do
  describe '#format' do
    let(:service) { DogBreedImageFetcherService.new }

    context 'when fetch_type is random and breed name is present in the api' do
      it 'returns a hash with breed name and a random image URL' do
        result = service.format(breed: 'african', fetch_type: 'random')
        expect(result[:images].length).to eq(1)
        expect(result[:breed]).to eq('african')
        expect(result[:images].first).to include('african')
      end
    end

    context 'when fetch_type is random and breed name is not present in the api' do
      it 'returns default not found image URL' do
        result = service.format(breed: 'asian', fetch_type: 'random')
        expect(result[:images].length).to eq(1)
        expect(result[:images]).to eq([DogBreedImageFetcherService::DEFAULT_IMAGE])
      end
    end

    context 'when fetch_type is all images of the breed and breed name is present in the api' do
      it 'returns a hash with breed name and all image URLs' do
        result = service.format(breed: 'african', fetch_type: 'all')
        expect(result[:images].length).to be > 1
        expect(result[:breed]).to eq('african')
        expect(result[:images].first).to include('african')
      end
    end

    context 'when fetch_type is all images and breed name is not present in the api' do
      it 'returns default not found image URL' do
        result = service.format(breed: 'asian', fetch_type: 'all')
        expect(result[:images].length).to eq(1)
        expect(result[:images]).to eq([DogBreedImageFetcherService::DEFAULT_IMAGE])
      end
    end
  end

  describe '#fetch_random_image_of_a_breed' do
    let(:service) { DogBreedImageFetcherService.new }

    context 'when data for breed name is present in the api' do
      it 'returns an array containing the random image URL of that breed' do
        result = service.fetch_random_image_of_a_breed('african')

        expect(result.length).to eq(1)
        expect(result.first).to include('african')
      end
    end

    context 'when data from breed name is not present in the api' do
      it 'returns an array containing the default not found image URL' do
        result = service.fetch_random_image_of_a_breed('asian')
        expect(result.length).to eq(1)
        expect(result).to eq([DogBreedImageFetcherService::DEFAULT_IMAGE])
      end
    end
  end

  describe '#fetch_all_images_of_a_breed' do
    let(:service) { DogBreedImageFetcherService.new }

    context 'when data for breed name is present in the api' do
      it 'returns an array containing all the image URLs of that breed' do
        result = service.fetch_all_images_of_a_breed('african')

        expect(result.length).to be > 1
        expect(result.first).to include('african')
      end
    end

    context 'when data from breed name is not present in the api' do
      it 'returns an array containing the default not found image URL' do
        result = service.fetch_all_images_of_a_breed('asian')
        expect(result.length).to eq(1)
        expect(result).to eq([DogBreedImageFetcherService::DEFAULT_IMAGE])
      end
    end
  end
end
