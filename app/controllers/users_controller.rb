class UsersController < ApplicationController

  #all signed up users except the current user.
  def index
    @users = User.all.reject {|u| u.id == current_user.id}
    # @user = User.find(params[:id])
  end
  
  #define the user and the listings made by the user
  def show
@user = User.find(params[:id])
@user_listings = @user.listings
  end
end
