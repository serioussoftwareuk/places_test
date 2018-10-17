require 'rails_helper'
require 'sidekiq/testing'
RSpec.describe GeocodeWorker, type: :worker do
  before do
    @place = Place.create(city: 'London')
  end

  it 'should create a job' do
    expect {
      GeocodeWorker.perform_async(@place.id)
    }.to change(GeocodeWorker.jobs, :size).by(1)
  end

  it 'should get place coordinates' do
    Sidekiq::Testing.inline! do
      GeocodeWorker.perform_async(@place.id)
      expect(@place.reload.latitude).not_to be_nil
      expect(@place.reload.longitude).not_to be_nil
    end
  end
end
