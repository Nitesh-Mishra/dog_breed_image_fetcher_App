# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return if params[:breed].blank?

    data = DogBreedImageFetcherService.new.format(index_params)
    render json: data
  end

  private

  def index_params
    params.permit(:breed, :fetch_type)
  end
end
