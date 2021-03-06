class UsersController < ApplicationController

  before_action :authenticate_user!
  # URL直打ち防止
  before_action :correct_user, only: [:edit, :update]


  def index
  	@users = User.all
  	@user = current_user
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @users = User.all
  	@books = @user.books
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
        redirect_to user_path(current_user.id)
      end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
end
