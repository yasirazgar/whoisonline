module Users::UserStatusHelper
  private

  def update_status_online
    current_user.update_attribute(:status, User::Status::ONLINE)
  end

  def update_status_offline
    current_user.update_attribute(:status, User::Status::OFFLINE)
  end
end
