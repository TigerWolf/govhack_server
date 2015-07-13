require 'spec_helper'

describe V1 do
  def app
    V1
  end

  describe 'GET /api/v1/courses/list' do
    it 'requires authentication' do
      get '/api/v1/courses/list'
      expect(last_response.status).to eq(401)
    end
  end

  describe 'GET /api/v1/students/list' do
    it 'requires authentication' do
      get '/api/v1/students/list'
      expect(last_response.status).to eq(401)
    end
  end

  describe 'GET /api/v1/courses/list' do

    before do
      allow_any_instance_of(V1).to receive(:authorized?).and_return(true)
      allow_any_instance_of(V1).to receive(:authorized!).and_return(true)
      # allow(V1).to receive(:authorized!).and_return({something: 'testing'})

      user = 'username'
      pw = 'password'
      binding.pry
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    end

    it 'gets results when logged in' do
      get '/api/v1/students/list'
      expect(last_response.status).to eq(200)
    end

  end
end
