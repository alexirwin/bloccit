class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end
  
  def flash_attack 
       flash[:notice] = "This is a flash notice!"
  end

 protected
 
  def configure_permitted_parameters
   	if devise_controller?
	   	devise_parameter_sanitizer.for(:sign_up) << :name
	end
  end 
end

# before_action :configure_permitted_parameters, if: :devise_controller?
 
   # protected
 
   # def configure_permitted_parameters
   #   devise_parameter_sanitizer.for(:sign_up) << :name
   # end
