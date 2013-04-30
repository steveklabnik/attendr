class AttendeesController < ApplicationController
  def update
    @attendee = Attendee.find(params[:id])
    @attendee.attended = params[:attendee][:attended]
    @attendee.save

    redirect_to event_path(@attendee.event_slug)
  end
end
