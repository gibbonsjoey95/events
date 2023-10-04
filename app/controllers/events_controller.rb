class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new 
  end

  def create
    @user = current_user
    @event = @user.events.build(events_params)

    if @event.save  
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator
  end

  private

  def events_params
    params.require(:event).permit(:name, :date, :location)
  end
end
