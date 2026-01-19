class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]
 
  def index
    @images = current_user.images
  end
 
  def show
  end
 
  def new
    @image = current_user.images.build
  end
 
  def edit
  end
 
  def create
    @image = current_user.images.build(image_params)
 
    if @image.save
      redirect_to @image, notice: "Image was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
 
  def update
    if @image.update(image_params)
      redirect_to @image, notice: "Image was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
 
  def destroy
    @image.destroy
    redirect_to images_url, notice: "Image was successfully destroyed."
  end
 
  private
 
  def set_image
    @image = current_user.images.find(params[:id])
  end
 
  def image_params
    params.require(:image).permit(:name, :picture)
  end
end