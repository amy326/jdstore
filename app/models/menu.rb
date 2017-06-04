class Menu < ApplicationRecord
   mount_uploader :image, ImageUploader
   belongs_to :category
   belongs_to :product
end
