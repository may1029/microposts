class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favorite_pos, index: true# , foreign_key: true
      # t.reference :unfavorite, index: true
      t.references :favorite_usr, index: true

      t.timestamps null: false

      # t.index [:follower_id, :followed_id], unique: true
    end
  end
end
