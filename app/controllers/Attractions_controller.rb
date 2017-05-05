class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
  end
end
