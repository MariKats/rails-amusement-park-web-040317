class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # render :new
      redirect_to root_path
    end
  end

  def show
    if self.logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      @user.update(user_params)
      redirect_to user_path
    else
      redirect_to edit_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end 

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :height, :nausea, :tickets, :admin)
  end
end
