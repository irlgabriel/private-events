class UsersController < ApplicationController 

  def show
    @user = User.find(params[:id])
  end

  def self.upcoming_events
    @events = @user.attended_events
    
  end
end