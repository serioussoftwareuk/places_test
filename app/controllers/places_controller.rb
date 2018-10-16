class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def create
    Place.import(params[:file])
    redirect_to :root
  rescue
    redirect_to :root, alert: 'Invalid CSV file format.'
  end
end
