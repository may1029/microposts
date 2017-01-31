# coding: utf-8
class UsersController < ApplicationController
# <<<<<<< HEAD
#   before_action :set_user, only: [:edit, :update]
# =======
  before_action :logged_in_user, only: [:index, :edit, :update, :following, :follower, :destroy]
# >>>>>>> followings-followers

  def show # 追加
    @user = User.find(params[:id])
    @user_following = @user.following_relationships
    @user_follower = @user.follower_relationships
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

  def edit
    # @user = User.find(params[:id])
    unless @user = current_user
      redirect_to user_uerl(@user)
    end
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

  def following
    @user = User.find(params[:id]) #現在のuser_id
    # @users = current_user.following_relationships.find_by(params[:id]).followed
    #current_user: login中のuser_id
    @users = @user.following_relationships
    render 'show_following'
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.follower_relationships
    render 'show_follower'
# >>>># >>> followings-followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :hometown, :age, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
    # redirect_to root_path if @user != current_user
  end

end
