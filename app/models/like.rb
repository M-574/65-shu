class Like < ApplicationRecord
  belongs_to :gourmet
  belongs_to :user
  validates_uniqueness_of :gourmet_id, scope: :user_id
end