class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  after_filter :update_user_activity

  private

  def update_user_activity
    current_user.update_attribute(:status, User::Status::ONLINE) if current_user
  end

end
