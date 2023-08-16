class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, presence: true
  validates :adress, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
