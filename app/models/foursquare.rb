class Foursquare < ActiveRecord::Base

  def self.venue_lookup(name)
    search_string = name.split(" ").join("+")
    @results = HTTParty.get("https://api.foursquare.com/v2/venues/explore?client_id=#{ENV["Client_ID"]}&client_secret=#{ENV["Client_Secret"]}&v=20130815&ll=40.7,-74&query=#{search_string}")
  end

  def self.find_current_visitors(foursquare_id)
    @current_visitors = HTTParty.get("https://api.foursquare.com/v2/venues/#{foursquare_id}/herenow?client_id=#{ENV["Client_ID"]}&client_secret=#{ENV["Client_Secret"]}&v=20130815")["response"]["hereNow"]["count"]
  end

end
