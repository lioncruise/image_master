class SessionsController < ApplicationController
  include SessionsHelper
  @@current_user = nil

  def new
  end

  #登录
  def create
    @user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
    if @user
      #render plain: sprintf("welcome, %s!", @user.name)
      @@current_user = @user
      redirect_to @user
    else
      flash.now[:login_error] = "invalid username or password"
      render 'new'
    end
  end

  def upload

    @picture = Picture.new(picture_params)
    @picture.save
    render 'welcome/index'

  end

  def user_params
    params.require(:session).permit(:name,:password)
  end

  def picture_params
    params.require(:uploadpicture).permit(:url, :url_cache, :user_id)
  end
end
