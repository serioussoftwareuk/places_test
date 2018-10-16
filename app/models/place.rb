class Place < ApplicationRecord
  require 'csv'

  geocoded_by :address
  after_validation :geocode

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Place.create!(row.to_hash)
    end
  end

  def address
    [street, city, state, country, zip].compact.join(', ')
  end
end
