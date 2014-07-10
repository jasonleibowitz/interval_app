task :update_visitors => :environment do
  desc "Updates all venue visitor information"
  Venue.all.each do |venue|
    venue.current_visitors
  end
end
