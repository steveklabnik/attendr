require 'csv'    

class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.from_csv(params[:event][:csv].tempfile, params[:event][:name])

    redirect_to @event, :notice => "Event created!"
  end
end
