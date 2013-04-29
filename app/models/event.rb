class Event < ActiveRecord::Base
  def self.from_csv(file, name)
    csv = CSV.parse(file, :headers => true, :header_converters => :symbol)

    @event = Event.create(:name => name)

    csv.each do |row|
      Attendee.create!(row.to_hash.merge({:event_id => @event.id}))
    end
  end
end
