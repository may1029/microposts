class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :favorites, :liking_id, :user_id
    rename_column :favorites, :liked_id, :micropost_id
  end
end
