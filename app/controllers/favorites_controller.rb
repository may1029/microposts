class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorite.build(micropost: @micropost)

    if @favorite.save
      redirect_to microposts_url, notice: "add favorites"
    else
      redirect_to microposts_url, alert: "missing favorite for this micropost"
    end
    # @favorite = User.find(params[:liking_id])
    # current_user.favorite(@favorite)
  end

  def destroy
  #   @favorite = current_user.favorite_relationships.find(params[:id]).favorited_usr
    #   current_user.unfavorite(@favorite)
    @favorite = current_user.favorite.find_by!(micropost_id: params[:micropost_id])
    @favorite.destroy
    redirect_to microposts_url, notice: "remove the favorite"
  end
end
