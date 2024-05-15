# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @breed = params[:breed]
    return unless @breed.present?

    fetch_breed_image
    render json: { breed: @breed, image: @image_url }
  end

  private

  def fetch_breed_image
    response = HTTParty.get("https://dog.ceo/api/breed/#{@breed.downcase}/images/random")
    @image_url = if response.success?
                   response.parsed_response['message']
                 else
                   'https://via.placeholder.com/400x300?text=No+Image+Found'
                 end
  end
end
