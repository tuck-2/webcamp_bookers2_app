class UsersController < ApplicationController

  def new
  end

  def create
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated profile successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
