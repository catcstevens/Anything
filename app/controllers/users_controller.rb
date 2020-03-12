class UsersController < ApplicationController

  def index
    @users = User.all 
    # @user = User.find(params[:id])
  end
  
  def show
@user = User.find(params[:id])
@user_listings = @user.listings
  end
end
