class PostsController < ApplicationController
  
  def post_params
    params.require(:post).permit(:title, :image)
  end
end