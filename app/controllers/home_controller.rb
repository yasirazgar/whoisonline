class HomeController < ApplicationController

  def index
    @online_users = User.online - [current_user]
  end

end
