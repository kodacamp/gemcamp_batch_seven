class Post < ApplicationRecord
  # Todo: Read more about https://guides.rubyonrails.org/v3.2/active_record_validations_callbacks.html
  validates :title, presence: true
  validates :title, length: { in: 4..100 }
  # validates :title, length: { minimum: 4, maximum: 100 }
  validates :title, uniqueness: true
  # validates :title, inclusion: { in: ['small', 'medium', 'large'] }
  validates :content, presence: true, length: { minimum: 5, maximum: 4000 }

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
end