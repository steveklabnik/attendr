class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  # GET /attendees
  def index
    @attendees = Attendee.all
  end

  # GET /attendees/1
  def show
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees
  def create
    @attendee = Attendee.new(attendee_params)

    if @attendee.save
      redirect_to @attendee, notice: 'Attendee was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /attendees/1
  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: 'Attendee was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /attendees/1
  def destroy
    @attendee.destroy
    redirect_to attendees_url, notice: 'Attendee was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendee_params
      params.require(:attendee).permit(:number, :ticket, :ticket_name, :ticket_email, :event, :void, :status, :price, :ticket_reference, :tags, :unique_ticket_url, :unique_order_url, :order_reference, :order_name, :order_email, :order_ip, :order_date, :attended)
    end
end
