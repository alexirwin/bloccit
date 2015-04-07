class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :flash_attack, :configure_permitted_parameters
  
  def flash_attack 
       flash[:notice] = "This is a flash notice!"
  end

 protected
 
  def configure_permitted_parameters
   	if devise_controller?
	   	devise_parameter_sanitizer.for(:sign_up) << :name
	end
  end

   # before_action :configure_permitted_parameters, if: :devise_controller?
 
   # protected
 
   # def configure_permitted_parameters
   #   devise_parameter_sanitizer.for(:sign_up) << :name
   # end
end
