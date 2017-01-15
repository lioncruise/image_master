class WelcomeController < ApplicationController
  def index
    
  end

  def show
    @tag = Tag.find_by(name: welcome_params[:name])
 
    if !@tag
      redirect_to '/welcome/none'
    else
      @pictures = @tag.pictures
      puts @pictures
      render "tags/show"
    end
  end

  def none
  end

  # 这个方法允许在动作中使用 name 属性
  def welcome_params
    params.require(:keyword).permit(:name)
  end
end
