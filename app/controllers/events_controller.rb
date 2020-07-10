class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.created_events.build(event_params)
    byebug
    if @event.save
      redirect_to @events
    else
      render :new
    end
  end

  def show
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to @events
  end

  private

  def event_params
    params.require(:event).permit(:date, :location, :description)
  end


end