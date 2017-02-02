class RenameColumnFavorite < ActiveRecord::Migration
  def change
    rename_column :favorites, :liked_id, :user_id
    rename_column :favorites, :liking_id, :micropost_id
  end
end
