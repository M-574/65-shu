class Tag < ApplicationRecord
    has_many :gourmet_tags, dependent: :destroy
    has_many :gourmets, through: :gourmet_tags
end
