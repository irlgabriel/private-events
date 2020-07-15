class UsersController < ApplicationController 

  def show
    @user = User.find(params[:id])
  end

  def self.past_events
    @user.attended_events.select { |ev| Time.now > ev.date }
  end

  def self.future_events
    @user.attended_events.select { |ev| Time.now < ev.date }
  end

end