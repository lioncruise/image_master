class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @pictures = Picture.all
  end
end
