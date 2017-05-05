class AttractionsController < ApplicationController
  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
  end

  def create
      @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.save
      @attraction.update(attraction_params)
      redirect_to attraction_path
    else
      redirect_to edit_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end




  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end
