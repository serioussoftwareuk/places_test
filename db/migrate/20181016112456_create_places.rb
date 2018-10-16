class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :street,    default: ''
      t.string :city,      default: ''
      t.string :state,     default: ''
      t.string :country,   default: ''
      t.string :zip,       default: ''
      t.float  :latitude
      t.float  :longitude

      t.timestamps
    end
  end
end
