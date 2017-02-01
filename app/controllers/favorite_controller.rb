class FavoriteController < ApplicationController
  before_action :logged_in_user

  def create
    @favorite = User.find(params[:favorite_usr_id])
    current_user.favorite(@favorite)
  end

  def destroy
    @favorite = current_user.favorite_relationships.find(params[:id]).favorited_usr
    current_user.unfavorite(@favorite)
  end
end
