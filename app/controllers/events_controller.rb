class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    
    @events = Event.all.order("created_at DESC")
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path
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
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:date, :location, :description)
  end


end