# coding: utf-8
class UsersController < ApplicationController
  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
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

  def followings
    # @user = User.find(params[:follower_id])
    @user = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:followed_id])
    render 'show_followed'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :hometown, :age, :password, :password_confirmation)
  end

end
