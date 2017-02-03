class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user_id, index: true# , foreign_key: true
      # t.reference :unfavorite, index: true
      t.references :micropost_id, index: true

      t.timestamps null: false

      t.index [:user_id, :micropost_id], unique: true
    end
  end
end
