# coding: utf-8
class UsersController < ApplicationController
  def show # 追加
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
 
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Update your profile"
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :hometown, :age, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
