class Venue < ActiveRecord::Base
  has_many :visitors

  def current_visitors
    @visitors = Foursquare.find_current_visitors(self.foursquare_id)
    @current_visitors = Visitor.new(current_visitors: @visitors, venue_id: self.id)
    @current_visitors.js_time = self.created_at.strftime "%-m/%-d/%Y"
    @current_visitors.save!
  end

end

