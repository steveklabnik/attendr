require 'csv'    

class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    csv = params[:event][:csv]
    csv = CSV.parse(csv.tempfile, :headers => true, :header_converters => :symbol)

    @event = Event.create(:name => params[:event][:name])

    csv.each do |row|
      Attendee.create!(row.to_hash.merge({:event_id => @event.id}))
    end

    redirect_to @event, :notice => "Event created!"
  end
end
