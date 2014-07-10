class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save!
      flash[:notice] = "#{@venue.name} successfully added."
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def search
    @name = params[:q]
    @results = Foursquare.venue_lookup(@name)
  end

  private
  def venue_params
    return params.permit(:name, :foursquare_id, :address, :lat, :lon, :city, :state)
  end

end
