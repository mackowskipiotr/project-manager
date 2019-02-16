class UsersController < ApplicationController
  before_action :authenticate_user!

  # Return all users. Only for admin.
  def index
  	@users = User.all
  end
end
