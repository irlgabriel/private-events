class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #add username to sign-up 'table'
    devise_parameter_sanitizer.permit(:sign_up, keys:[:username])
    #add username to sign-in 'table'
    devise_parameter_sanitizer.permit(:sign_in, keys:[:username])
    #add username to account-update
    devise_parameter_sanitizer.permit(:account_update, keys:[:username])
  end

end
