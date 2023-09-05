class User < ApplicationRecord
  has_many :foods
  has_many :recipes
  has_many :recipe_foods, through: :recipes
end