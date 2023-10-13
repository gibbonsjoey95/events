class EventsController < ApplicationController
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new 
  end

  def create
    @user = current_user
    @event = @user.events.build(events_params)

    if @event.save  
      redirect_to @event, notice: 'Event was succesfully created'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator
    @attendees = @event.attendees
  end

  def attend
    @event = Event.find(params[:id])

    # Check if the current user is already attending the event
    if current_user.attended_events.include?(@event)
      redirect_to @event, notice: "You are already attending this event."
    else
      # Add the current user to the attendees
      @event.attendees << current_user
      redirect_to @event, notice: "You are now attending the event."
    end
  end

  def unattend
    @event = Event.find(params[:id])

    # Remove the current user from the attendees
    @event.attendees.delete(current_user)

    redirect_to @event, notice: "You have successfully removed yourself from the event."
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(events_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  
    redirect_to events_path, notice: 'Event was successfully deleted.'
  end

  private

  def events_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
