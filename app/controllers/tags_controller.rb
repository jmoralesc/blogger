class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

   def destroy
     @tag = Tag.find(params[:id])
      @tag.destroy
      flash.notice = "Article '#{@tag.name}' Deleted!"
      redirect_to tags_path
   end 

   def tag_params
     params.require(:tag).permit(:name)
   end
   
 end
