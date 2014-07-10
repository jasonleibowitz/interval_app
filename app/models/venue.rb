class Venue < ActiveRecord::Base
  has_many :visitors

  def current_visitors
    @visitors = Foursquare.find_current_visitors(self.foursquare_id)
    Visitor.create(current_visitors: @visitors, venue_id: self.id)
  end

end
