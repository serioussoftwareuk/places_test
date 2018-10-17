class GeocodeWorker
  include Sidekiq::Worker

  def perform(place_id)
    place = Place.find(place_id)
    place.geocode

    if place.geocoded?
      place.save
      p "Place #{place_id} geocoded"
    end
  end
end
