# spec/requests/users_spec.rb
require 'rails_helper'
require 'rails-controller-testing' # Add this line
RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('All Users')
    end
  end

  # Similar blocks for other actions (show, create, update, destroy)
end
