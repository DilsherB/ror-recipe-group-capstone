class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  after_initialize :set_default_quantity

  def set_default_quantity
    self.quantity ||= 1
  end
end
