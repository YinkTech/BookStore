class Group < ApplicationRecord
  belongs_to :user

  has_many :items, dependent: :destroy

  mount_uploader :icon, ImageUploader
end
