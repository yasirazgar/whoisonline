class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :validatable


  module Status
    OFFLINE = 0
    ONLINE = 1
  end

  scope :online, -> {
    where("status = ? AND updated_at > ?", Status::ONLINE, 10.minutes.ago)
  }

  scope :offline, -> {
    where("status = ? OR updated_at < ?", Status::OFFLINE, 30.minutes.ago)
  }

  scope :away, -> {
    where("status = ? AND updated_at < ?", Status::ONLINE, 15.minutes.ago)
  }

  def name_display
    if (full_name = name).present?
      full_name
    else
      email
    end
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end
