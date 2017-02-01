class Favorite < ActiveRecord::Base
  belongs_to :favorite_pos, class_name: "Micropost"
  belongs_to :favoeite_usr, class_name: "User"
  # belongs_to :unfavorite, class_name: "Micropost"
end
