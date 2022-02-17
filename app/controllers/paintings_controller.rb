class PaintingsController < ApplicationController
  def index
    @painting = Painting.all 
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to painting_path(@painting)
    end
  end

  def show
    @painting = Painting.find_by(id: params[:id])
  end

  private

  def painting_params
    params.require(:painting).permit(
      :image,
      :id
    )
  end
end
