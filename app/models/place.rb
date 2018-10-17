class Place < ApplicationRecord
  require 'csv'

  geocoded_by :address

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      place = Place.create!(row.to_hash)
      GeocodeWorker.perform_async(place.id)
    end
  end

  def address
    [street, city, state, country, zip].compact.join(', ')
  end
end
