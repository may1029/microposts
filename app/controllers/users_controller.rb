# coding: utf-8
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]

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

  def following
    @user = User.find(params[:id])
    # @users = current_user.following_relationships.find_by(params[:id]).followed
    @users = current_user.following_relationships
    render 'show_following'
  end

  def follower
    @user = User.find(params[:id])
    @users = current_user.follower_relationships
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :hometown, :age, :password, :password_confirmation)
  end

end
