class ApplicationController < ActionController::Base

  def root
    render html: "rails_appへようこそ!"
  end
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana])
    end
  end

