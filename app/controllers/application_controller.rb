# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin_user!
    authenticate_user!
    return if current_user.admin?

    redirect_to root_path, flash: { alert: 'You are not allowed to do that.' }
  end

  protected

  def configure_permitted_parameters
    added_keys = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_keys)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_keys)
  end
end
