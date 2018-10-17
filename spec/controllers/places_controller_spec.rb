require 'rails_helper'

describe PlacesController, type: :controller do
  it 'should create places from file' do
    file = fixture_file_upload('spec/fixtures/test.csv')
    expect { post :create, params: { file: file } }.to change { Place.count }.by(10)
    expect(response).to have_http_status(:redirect)
  end

  it 'should not create places with invalid file' do
    post :create, params: { file: 'file' }
    expect(flash[:alert]).to eq 'Invalid CSV file format.'
    expect(response).to have_http_status(:redirect)
  end
end