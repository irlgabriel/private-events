class UsersController < ApplicationController 


  

  def show
    @user = User.find(params[:id])
    @events = @user.attended_events
  end



end