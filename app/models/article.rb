class Article < ApplicationRecord
  resourcify
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :bird, BirdUploader
  paginates_per 2
end
