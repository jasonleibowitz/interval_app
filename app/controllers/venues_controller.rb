class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @visitors = @venue.visitors.last(30)

    respond_to do |format|
      format.html
      format.json { render :json => @visitors.to_json }
    end
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
