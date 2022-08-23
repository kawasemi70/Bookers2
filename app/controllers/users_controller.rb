class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @book = Book.new
    @books =Book.all
    @user = current_user
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new


  end




  def edit
  	@user = User.find(params[:id])
   # if @users = current_user
     # redirect_to user_path(current_user.id)
    #end
  end



  #def update
  #@user = User.find(params[:id])
    #if @user.update(user_params)
    #flash[:notice] = "You have updated user successfully."
   # redirect_to user_path(@user.id)
   # else
   # render :edit
   # end
 # end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:'You have updated user successfully.'
    else
      render :edit
    end
  end




  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end



  # before_action
  def correct_user
    user = User.find(params[:id])
    redirect_to user_path(current_user.id) if current_user != user
  end

  def set_user
    @user = User.find(params[:id])
  end
end

