class AttendeesController < ApplicationController
  def update
    @attendee = Attendee.find(params[:id])
    @attendee.attended = params[:attendee][:attended]
    @attendee.save

    # this has to be event_id because Attendees have an :event attribute.
    redirect_to event_path(@attendee.event_id)
  end
end
