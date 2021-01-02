class Sweet < ApplicationRecord
  validates :title, presence: true, length: { maximum: 15}
  validates :price, presence: true
  validates :calorie, presence: true
  validates :description, presence: true, length: { maximum: 15}
end
