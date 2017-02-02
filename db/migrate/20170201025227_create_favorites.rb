class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :liking_id, index: true# , foreign_key: true
      # t.reference :unfavorite, index: true
      t.references :liked_id, index: true

      t.timestamps null: false

      # t.index [:follower_id, :followed_id], unique: true
    end
  end
end
