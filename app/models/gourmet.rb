class Gourmet < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :gourmet_tags, dependent: :destroy
    has_many :tags, through: :gourmet_tags
end

