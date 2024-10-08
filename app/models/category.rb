class Category < ApplicationRecord
  validates :name, presence: true
  # has_many :post_category_ships, dependent: :destroy
  # has_many :post_category_ships, dependent: :delete_all
  # has_many :post_category_ships, dependent: :nullify
  # has_many :post_category_ships, dependent: :restrict_with_error
  # has_many :post_category_ships, dependent: :restrict_with_exception
  has_many :post_category_ships, dependent: :destroy
  has_many :posts, through: :post_category_ships
end
