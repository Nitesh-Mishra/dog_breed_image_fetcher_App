# frozen_string_literal: true

class DogBreedImageFetcherService
  DEFAULT_IMAGE = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv8R5eF19hygJA1-FaytKV3-frVqD_ASq4iWJ7b6h6NQ&s'

  def format(options)
    breed_name = options[:breed].downcase
    image_urls = if options[:fetch_type] == 'random'
                   fetch_random_image_of_a_breed(breed_name)
                 else
                   fetch_all_images_of_a_breed(breed_name)
                 end
    { breed: breed_name, images: image_urls }
  end

  def fetch_random_image_of_a_breed(breed_name)
    response = HTTParty.get("https://dog.ceo/api/breed/#{breed_name}/images/random")
    image_url = if response.success?
                  response.parsed_response['message']
                else
                  DEFAULT_IMAGE
                end
    Array(image_url)
  end

  def fetch_all_images_of_a_breed(breed_name)
    response = HTTParty.get("https://dog.ceo/api/breed/#{breed_name}/images")
    if response.success?
      response.parsed_response['message']
    else
      [DEFAULT_IMAGE]
    end
  end
end
