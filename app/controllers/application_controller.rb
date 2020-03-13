class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # Only call this before_action if devise_controller will allow for permitted parameters below
     before_action :configure_permitted_parameters, if: :devise_controller?
     before_action :authenticate_user!


     #permitted devise parameters (for users)
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :about, :location, :delivers])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :first_name, :last_name, :about, :location, :delivers])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :about, :location, :delivers])
    end
end
