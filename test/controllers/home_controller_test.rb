require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    context 'when breed parameter is present and fetch type is random and entered breed name is present in api' do
      it 'renders the random image of that breed' do
        get :index, params: { breed: 'african', fetch_type: 'random' }
        expect(response).to have_http_status(:success)
        expect(response.parsed_body['images'].first).to include('african')
        expect(response.parsed_body['images'].length).to eq(1)
        expect(response.parsed_body['breed']).to eq('african')
      end
    end

    context 'when breed parameter present and fetch type is random and entered breed name is not present in the api' do
      it 'renders the default not found image' do
        get :index, params: { breed: 'asian', fetch_type: 'random' }
        expect(response).to have_http_status(:success)
        expect(response.parsed_body['images'].first).to eq(DogBreedImageFetcherService::DEFAULT_IMAGE)
        expect(response.parsed_body['images'].length).to eq(1)
      end
    end

    context 'when breed parameter present and fetch type is all and entered breed name is present in api' do
      it 'renders all the images of that breed' do
        get :index, params: { breed: 'african', fetch_type: 'all' }
        expect(response).to have_http_status(:success)
        expect(response.parsed_body['images'].first).to include('african')
        expect(response.parsed_body['images'].length).to be > 1
        expect(response.parsed_body['breed']).to eq('african')
      end
    end

    context 'when breed parameter present and fetch type is all and entered breed name is not present in api' do
      it 'renders the default not found image' do
        get :index, params: { breed: 'asian', fetch_type: 'all' }
        expect(response).to have_http_status(:success)
        expect(response.parsed_body['images'].first).to eq(DogBreedImageFetcherService::DEFAULT_IMAGE)
        expect(response.parsed_body['images'].length).to eq(1)
      end
    end
  end
end
