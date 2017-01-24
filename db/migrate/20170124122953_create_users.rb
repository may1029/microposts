# coding: utf-8
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birthday
      t.string :hometown
      t.integer :age

      t.timestamps null: false

      t.index :email, unique: true # この行を追加
    end
  end
end
