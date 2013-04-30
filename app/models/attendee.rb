class Attendee < ActiveRecord::Base
  def self.checked_in_total
    checked_in = all.inject(0) do |sum, attendee|
      if attendee.attended?
        sum + 1
      else
        sum
      end
    end

    "#{checked_in} / #{count}"
  end

  def event_slug
    Event.find(event_id).slug
  end
end
