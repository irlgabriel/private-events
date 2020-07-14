class EventsController < ApplicationController
  include ActionView::Helpers::DateHelper

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all.order("created_at DESC")
    #byebug
  end
  
  def new
    @event = current_user.created_events.new
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
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
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

  def join_event
    @events = Event.all
    @user = current_user
    @event = Event.find(params[:event_id])
    @event.attendees.push(@user) if !@event.attendees.include?(@user)
    render 'index'
  end

  def unjoin_event
    @events = Event.all
    @user = current_user
    @event = Event.find(params[:event_id])
    @event.attendees.delete(@user)
    render 'index'
  end

  

  private

  def event_params
    params.require(:event).permit(:date, :location, :description)
  end


end