module Users::UserStatusHelper
  private

  def update_status_online
  if current_user.present?
    current_user.update_attribute(:status, User::Status::ONLINE)
  elsif resource.present?
    resource.update_attribute(:status, User::Status::ONLINE)
  end

  end

  def update_status_offline
    current_user.update_attribute(:status, User::Status::OFFLINE)
  end
end
