class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event added successfully'
      redirect_to events_path
    else
      flash[:notice] = @event.errors.full_messages.join(', ')
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
