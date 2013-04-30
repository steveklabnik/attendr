require 'csv'    

class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.from_csv(params[:event][:csv].tempfile, params[:event][:name])

    redirect_to @event, :notice => "Event created!"
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html
      format.csv do
        send_data(
          @event.to_csv, 
          :type => 'text/csv',
          :filename => @event.filename
        )
      end
    end
  end
end
