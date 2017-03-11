class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
include Users::UserStatusHelper
after_filter :update_status_online, :only => [:create]
before_filter :update_status_offline, :only => [:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

end
