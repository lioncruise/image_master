class PicturesController < ApplicationController
  def index
    #@user = User.find(params[:user_id])
    @pictures = Picture.all
    #redirect_to user_path(@user)
    #render pictures_index_path
  end

  # POST   /pictures
  def create
    @tag = Tag.find_by(name: picture_params[:name])

    @pictures = @tag.pictures

    render "tags/show"
  end

  def show
    @url=params[:name]
    #render "welcome/index"
  end
  
  # 这个方法允许在动作中使用picture表单的额 title 和 text 属性
  def picture_params
    params.require(:picture).permit(:url, :name)
  end
end
